SELECT
    allc.continent_code,
    allc.currency_code,
    allc.currency_usage
FROM
    (SELECT
        continent_code,
        currency_code,
        max(currency_usage) AS currency_usage
    FROM
        (SELECT
            continent_code,
            currency_code,
            count(currency_code) AS currency_usage
        FROM countries
        GROUP BY continent_code, currency_code
        ) AS group_currency
    GROUP BY continent_code) AS maxims,
    (SELECT
        continent_code,
        currency_code,
        count(currency_code) AS currency_usage
    FROM countries
    GROUP BY continent_code, currency_code
    HAVING currency_usage > 1
    ) AS allc
WHERE allc.continent_code = maxims.continent_code AND allc.currency_usage = maxims.currency_usage
ORDER BY
    continent_code,
    currency_code;