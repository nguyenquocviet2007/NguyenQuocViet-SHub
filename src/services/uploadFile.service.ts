import path from 'path'
import xlsx from 'xlsx'
import fs from 'fs'
import calculateTotalPrice from '../utils/calculateSum'

class UploadFileService {
    static async uploadFile(file: Express.Multer.File) {
        if (!file || !file.originalname.endsWith('.xlsx')) {
            throw new Error('Invalid File Format. Please upload again! Or Upload File False')
        }

        const uploadDir = path.join(__dirname, '../uploads')
        if(!fs.existsSync(uploadDir)) {
            fs.mkdirSync(uploadDir, {recursive: true})
        }
        const filePath = path.join(uploadDir, file.originalname);
        fs.writeFileSync(filePath, file.buffer)

        const xlsxFile = xlsx.read(file.buffer, {type: 'buffer'})
        const sheetName = xlsxFile.SheetNames[0]
        const workSheet = xlsxFile.Sheets[sheetName]
        const jsonData = xlsx.utils.sheet_to_json(workSheet)

        return jsonData
    }

    static async getInfoFromFile(filePath: string, startTime: string, endTime: string) {
        if(!fs.existsSync(filePath)) {
            throw new Error('File not Found')
        }

        const xlsxFile = xlsx.readFile(filePath)
        const sheetName = xlsxFile.SheetNames[0]
        const workSheet = xlsxFile.Sheets[sheetName]

        const jsonData = xlsx.utils.sheet_to_json(workSheet)
        jsonData.splice(0, 5)
        const filteredData = jsonData.map(item => ({
            time: (item as any).__EMPTY_1,
            price: (item as any).__EMPTY_7
        }))
        .sort((a, b) => {
            const timeA = a.time.split(':').map((num: Number) => parseInt(num.toString(), 10)); 
            const timeB = b.time.split(':').map((num: Number) => parseInt(num.toString(), 10)); 
            const totalSecondsA = timeA[0] * 3600 + timeA[1] * 60 + timeA[2];
            const totalSecondsB = timeB[0] * 3600 + timeB[1] * 60 + timeB[2]; 

            // Return the difference for sorting
            return totalSecondsA - totalSecondsB;
        })
        const totalPrice = calculateTotalPrice(startTime, endTime, filteredData)
        return totalPrice
    }
}

export default UploadFileService