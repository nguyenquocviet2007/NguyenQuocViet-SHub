import { Request, Response, NextFunction } from "express";
import UploadFileService from "../services/uploadFile.service";
import path from "path";

class UploadFileController {
    uploadFile = async (req: Request, res: Response, next: NextFunction): Promise<void> => {
        try {
            res.status(200).send({
                message: 'Upload successfully!',
                metadata: await UploadFileService.uploadFile(req.file!)
            })
            return
        } catch (error) {
            console.error(error)
            res.status(500).send({message: 'Internal Server Error!'})
            return 
        }
    }

    getInfoFromFile = async(req: Request, res: Response, next: NextFunction): Promise<void> => {
        try {
            const {fileName} = req.params
            const {startTime, endTime} = req.body
            const trueFileName = fileName+'.xlsx'
            const filePath = path.join(__dirname, '../uploads', trueFileName);
            res.status(200).send({
                message: 'Get Infor Successfully!',
                metadata: await UploadFileService.getInfoFromFile(filePath, startTime, endTime)
            })
            return
        } catch (error) {
            console.error(error)
            res.status(500).send({message: 'Internal Server Error!'})
            return 
        }
    }
}

export default UploadFileController