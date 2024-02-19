use bankloans;
select * from loans;
## sum of total loans according to the year
select Loan_issued_year, sum(loan_amnt) as total_loan from loans group by loan_issued_year order by 1;

## Grade and sub-grade wise revol balance 
select grade, sub_grade, sum(revol_bal) as total_revol_bal from loans group by grade, sub_grade order by grade; 

## total payment for verified VS non-verified 
select verification_status,  concat(format(sum(total_pymnt)/1000, 0), 'K') as total_payment from loans  
where verification_status in ('verified', 'not verified')
group by verification_status order by 1;

## State wise last credit pulled wise loan status
select addr_state as state, last_credit_pull_d, loan_status from loans order by addr_state;

## Home ownership VS last payment date 
select home_ownership, last_pymnt_d from loans order by home_ownership;

## loan status wise loan amount 
select loan_issued_year, loan_status, sum(loan_amnt) from loans group by loan_issued_year, loan_status order by loan_issued_year;

## loan amount(only charged off amount) VS recoveries 
select loan_issued_year, loan_status, concat(format(sum(loan_amnt)/10000,0),"K"), concat(format(sum(recoveries)/1000,0),'K') from loans 
where loan_status in ('charged off') 
group by loan_issued_year, loan_status 
order by loan_issued_year;



