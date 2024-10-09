import axios from 'axios'


class DataStructureAndAlgorithmService {
    static async fetchData() {
        const response = await axios.get('https://test-share.shub.edu.vn/api/intern-test/input')
        return response.data
    }

    static calculateData(data: number[], queries: {type: string; range: number[]}[]): number[] {
        const dataLength = data.length
        
        const type1Sum: number[] = new Array(dataLength+1).fill(0)

        const evenType2Sum: number[] = new Array(dataLength+1).fill(0)
        const oddType2Sum: number[] = new Array(dataLength+1).fill(0)

        for (let i = 0; i < dataLength; i++) {
            type1Sum[i+1] = type1Sum[i] + data[i]
            evenType2Sum[i+1] = evenType2Sum[i] + (i % 2 === 0 ? data[i] : 0)
            oddType2Sum[i+1] = oddType2Sum[i] + (i % 2 !== 0 ? data[i] : 0)
        }

        const results: number[] = []
        for (const query of queries) {
            const [l, r] = query.range

            if(query.type === "1") {
                const sum = type1Sum[r+1] - type1Sum[l]
                results.push(sum)
            } else if (query.type === "2") {
                const evenSum = evenType2Sum[r+1] - evenType2Sum[l]
                const oddSum = oddType2Sum[r+1] - oddType2Sum[l]
                const alternatingSum = (l % 2 === 0) ? evenSum - oddSum : oddSum - evenSum
                results.push(alternatingSum)
            }
        }

        return results
    }

    static async postData() {
        const response = await this.fetchData()
        const {token, data, query} = response as any

        const results = this.calculateData(data, query)

        const url = "https://test-share.shub.edu.vn/api/intern-test/output"
        try {
            const response = await axios.post(
                url,
                results,
                {
                    headers: {
                        'Authorization': `Bearer ${token}`,
                        'Content-Type': 'application/json'
                    }
                }
            )
            return response.data
        } catch (error) {
            console.error(error)
        }

    }
}


export default DataStructureAndAlgorithmService