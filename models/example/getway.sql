{{ config(materialized='table', alias='Payment_Method_agg') }}

{% set pmlist=["credit card/debit card", "UPI", "Net Banking", "Mobile Wallet"]%}

SELECT
    ORDER_ID,
    {% for Payment_Method in pmlist %}
    SUM(CASE WHEN payment_method = '{{Payment_Method}}' THEN amount END) AS "{{Payment_Method}}_amount",
    {% endfor %}
    SUM(amount) AS total_amount
FROM raw_data.PAYMENTS
GROUP BY ORDER_ID