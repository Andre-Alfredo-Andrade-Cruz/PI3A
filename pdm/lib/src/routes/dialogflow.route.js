const express = require("express");
const router = express.Router();
const bodyParser = require("body-parser");
const multer  = require('multer')
const upload = multer({ dest: 'uploads/' })
const util = require('util');
const fs = require('fs');
const _ = require('lodash');
//parte obrigatoria para autenticação
const dialogflow = require("dialogflow")
const { struct } = require("pb-util");

const privateKey = _.replace(process.env.DIALOGFLOW_PRIVATE_KEY, new RegExp("\\\\n", "\g"), "\n")

var dialogflowClient = {
  projectId: process.env.DIALOGFLOW_PROJECT_ID,
  sessionClient: new dialogflow.SessionsClient({
    credentials: {
      client_email: process.env.DIALOGFLOW_CLIENT_EMAIL,
      private_key: privateKey
    }
  })
}

router.use(bodyParser.json())
router.use(bodyParser.urlencoded({ extended: true }))

router.post('/message/text/send', async (req, res) => {
  let { text, email, sessionId } = req.body
  let { projectId, sessionClient } = dialogflowClient
  let sessionPath = sessionClient.sessionPath(projectId, sessionId)

  console.log("\n############################");
  console.log("Text Message to Dialogflow");
  console.log("Question...: " + text);
  console.log("SessionId..: " + sessionId);
  console.log("Email......: " + email);
  console.log("############################");

  const request = {
    session: sessionPath,
    queryInput: {
      text: {
        text: `${text}`,
        languageCode: "pt-BR"
      }
    },
    queryParams: {
      contexts: [
        {
          name: `projects/${projectId}/agent/sessions/${sessionId}/contexts/_context_data`,
          lifespanCount: 5,
          parameters: struct.encode({ u_email: email, sessionId: sessionId })
        }
      ]
    }
  };

  const responses = await sessionClient.detectIntent(request);

  console.log("Response....: " + JSON.stringify(responses));
  console.log("############################");
  res.send(responses)
})

router.post('/message/audio/send', upload.single('audioFile'), async (req, res) => {
  let { email, sessionId } = JSON.parse(req.body.json)
  let { projectId, sessionClient } = dialogflowClient
  let sessionPath = sessionClient.sessionPath(projectId, sessionId)

  console.log("\n############################");
  console.log("Audio Message to Dialogflow");
  console.log("SessionId..: " + sessionId);
  console.log("Email......: " + email);
  console.log("############################");

  const readFile = util.promisify(fs.readFile)
  const inputAudio = await readFile(req.file.path)
  const request = {
    session: sessionPath,
    queryInput: {
      audioConfig: {
        audioEncoding: 'AUDIO_ENCODING_AMR',
        sampleRateHertz: 8000,
        languageCode: 'pt-BR',
      },
    },
    inputAudio: inputAudio,
    outputAudioConfig: {
      audioEncoding: `OUTPUT_AUDIO_ENCODING_MP3`,
    },
  };

  const responses = await sessionClient.detectIntent(request)
  console.log('Detected intent:')
  console.log(JSON.stringify(responses))

  const audioFile = responses[0].outputAudio;
  util.promisify(fs.writeFile)("uploads/resposta.mp3", audioFile, 'binary');
})

router.post('/message/fullfilment', async (req, res) => {

})

module.exports = router;