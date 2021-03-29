const router         = require('express').Router();
const mainController = require('../controllers/mainController');

router.post('/', mainController.createNode);
router.get('/', mainController.findAllNodes);
router.get('/:id', mainController.findOneNode);

module.exports = router;