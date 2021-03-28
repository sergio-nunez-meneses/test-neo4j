const router         = require('express').Router();
const mainController = require('../controllers/mainController');

router.post('/', mainController.createNode);
router.get('/', mainController.findAllNodes);

module.exports = router;