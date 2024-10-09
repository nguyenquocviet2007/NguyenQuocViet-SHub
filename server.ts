import app from './src/app'
const PORT = 8080

const server = app.listen(PORT, () => {
    console.log(`WSV start with port ${PORT}`)
})