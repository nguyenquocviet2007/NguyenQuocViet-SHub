import express from 'express'
import morgan from 'morgan'
const app = express()
import helmet from 'helmet'
import compression from 'compression'
import { HttpError } from './core/errorResponse'
import { Request, Response, NextFunction } from 'express'

app.use(morgan('dev'))
app.use(helmet())
app.use(compression())
app.use(express.json())
app.use(express.urlencoded({
    extended: true
}))

app.use('', require('./routes'))

app.use((req: Request, res: Response, next: NextFunction) => {
    const error = new HttpError('NOT FOUND', 404)
    next(error)
})

app.use((error: HttpError, req: Request, res: Response, next: NextFunction) => {
    const statusCode = error.status || 500
    res.status(statusCode).json({
        status: 'error',
        code: statusCode,
        stack: error.stack,
        message: error.message || 'Internal Server Error'
    })
})

export default app 