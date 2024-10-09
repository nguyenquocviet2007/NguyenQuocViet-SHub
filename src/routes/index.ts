import express from 'express'
import upLoadFileRoutes from './uploadFile'
const router = express.Router()

router.use('/v1/api/upload', upLoadFileRoutes)

module.exports = router