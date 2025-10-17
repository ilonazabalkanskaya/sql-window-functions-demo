-- 📊 Анализ воронки опроса с использованием оконных функций
-- Демонстрация накопительных итогов

SELECT 
    question_number AS номер_вопроса,
    COUNT(DISTINCT user_id) AS пользователи_дошедшие_до_этого_вопроса,
    
    -- Оконная функция для накопительного итога
    SUM(COUNT(DISTINCT user_id)) OVER (
        ORDER BY question_number 
        ROWS UNBOUNDED PRECEDING
    ) AS накопительный_итог_пользователей,
    
    -- Дополнительный анализ: процент дошедших от первого вопроса
    ROUND(
        (COUNT(DISTINCT user_id) * 100.0 / 
        FIRST_VALUE(COUNT(DISTINCT user_id)) OVER (ORDER BY question_number)
    ), 2) AS процент_от_первого_вопроса,

    -- Анализ оттока между вопросами
    LAG(COUNT(DISTINCT user_id)) OVER (ORDER BY question_number) - 
    COUNT(DISTINCT user_id) AS отток_пользователей

FROM survey_data
GROUP BY question_number
ORDER BY question_number;

-- 📈 Дополнительный анализ: детализация по пользователям
SELECT 
    user_id,
    COUNT(*) AS количество_ответов,
    MIN(question_number) AS первый_вопрос,
    MAX(question_number) AS последний_вопрос
FROM survey_data
GROUP BY user_id
ORDER BY количество_ответов DESC;
