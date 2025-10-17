-- Создание тестовой таблицы с данными опроса
CREATE TABLE survey_data (
    user_id INT,
    question_number INT,
    answer VARCHAR(50)
);

-- Вставка тестовых данных
INSERT INTO survey_data (user_id, question_number, answer) VALUES
(1, 1, 'Да'),
(1, 2, 'Нет'),
(1, 3, 'Возможно'),
(2, 1, 'Нет'),
(2, 2, 'Да'),
(3, 1, 'Да'),
(3, 2, 'Нет'),
(3, 3, 'Да'),
(3, 4, 'Нет'),
(4, 1, 'Возможно'),
(4, 2, 'Да'),
(5, 1, 'Нет');

-- Просмотр данных
SELECT * FROM survey_data ORDER BY user_id, question_number;
