{{config(materialized='table', alias='Method_agg')}}

SELECT
    ORDER_ID,
    {% for Payment_Method in ["credit_card/debit_card", "upi", "Net_Banking", "Mobile Wallet"] %}
    SUM(CASE WHEN Payment_Method='{{Payment_Method}}' THEN amount ELSE 0 END) AS "{{Payment_Method}}_amount",
    {% endfor %}
    SUM(amount) AS total_amount
FROM raw_data.payments
GROUP BY 1;
