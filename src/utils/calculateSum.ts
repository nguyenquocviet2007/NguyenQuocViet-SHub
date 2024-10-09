function timeToSecond(time: string): number {
    const [hours, minutes, seconds] = time.split(':').map((num: string) => parseInt(num, 10));
    return hours * 3600 + minutes * 60 + seconds;
}


function calculateTotalPrice(startTime: string, endTime: string, data: any): number {
    const startSecond = timeToSecond(startTime)
    const endSecond = timeToSecond(endTime)
    const totalPrice = data
        .filter((item: any) => {
            const currentTime = item.time;
            const currentSeconds = timeToSecond(currentTime);
            return currentSeconds >= startSecond && currentSeconds <= endSecond;
        })
        .reduce((sum: number, item: any) => {
            return sum + (item as any).price; // Accumulate price
        }, 0);

    return totalPrice;
}


export default calculateTotalPrice