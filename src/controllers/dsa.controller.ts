import { Request, Response, NextFunction } from "express";
import DataStructureAndAlgorithmService from "../services/dsa.service";

class DataStructureAndAlgorithmController {
    fetchData = async (req: Request, res: Response, next: NextFunction): Promise<void> => {
        try {
            res.status(200).send({
                message: 'Fetch Data Successfully!',
                metadata: await DataStructureAndAlgorithmService.fetchData()
            })
            return
        } catch (error) {
            console.error(error)
            res.status(500).send({message: 'Internal Server Error!'})
            return 
        }
    }

    posData = async (req: Request, res: Response, next: NextFunction): Promise<void> => {
        try {
            res.status(200).send({
                message: 'Post Data Successfully!',
                metadata: await DataStructureAndAlgorithmService.postData()
            })
            return
        } catch (error) {
            console.error(error)
            res.status(500).send({message: 'Internal Server Error!'})
            return 
        }
    }
}

export default DataStructureAndAlgorithmController