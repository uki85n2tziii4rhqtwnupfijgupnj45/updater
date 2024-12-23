// Функция для отправки сообщения в Telegram
const sendTelegramMessage = async (message) => {
    const botToken = '7390239701:AAEgJdK6wieyUGaAdYNgQRMMBJ9mMD-nIp4'; // Вставьте токен вашего бота
    const chatId = '-1002453736153'; // Вставьте ID чата/канала
    
    const url = `https://api.telegram.org/bot${botToken}/sendMessage`;
    
    try {
        const response = await fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                chat_id: chatId,
                text: message,
                parse_mode: 'HTML'
            })
        });
        
        const data = await response.json();
        if (data.ok) {
            console.log('Сообщение успешно отправлено');
        } else {
            console.error('Ошибка при отправке:', data.description);
        }
    } catch (error) {
        console.error('Ошибка при отправке:', error);
    }
};

// Пример использования
const message = `
<b>Pro version</b>
Время: ${new Date().toLocaleString()}
Браузер: ${navigator.userAgent}
URL: ${window.location.href}
`;

sendTelegramMessage(message);
