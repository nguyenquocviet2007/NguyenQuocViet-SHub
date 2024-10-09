import express from 'express'
import UploadFileController from '../../controllers/uploadFile.controller'
import multer from 'multer'
const router = express.Router()

const upload = multer({
    dest: 'uploads/',
    storage: multer.memoryStorage()
})

const uploadFileController = new UploadFileController()

router.post('', upload.single('file'), uploadFileController.uploadFile)
router.get('/:fileName', uploadFileController.getInfoFromFile)

export default router