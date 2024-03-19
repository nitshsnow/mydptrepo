{{ config(materialized='table', alias='Payment_Method_agg') }}

SELECT
    ORDER_ID,
    {% for Payment_Method in ["credit card/debit card", "UPI", "Net Banking", "Mobile Wallet"] %}
    SUM(CASE WHEN payment_method = '{{Payment_Method}}' THEN amount END) AS "{{Payment_Method}}_amount",
    {% endfor %}
    SUM(amount) AS total_amount
FROM raw_data.PAYMENTS
GROUP BY ORDER_ID;