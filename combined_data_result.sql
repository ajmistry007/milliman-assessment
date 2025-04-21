with pat as (
              select  patient_id, 
                      first_name, 
                      last_name, 
                      row_number() over(partition by patient_id order by first_name) as row_num
        from patient)
,
med as (
          select  patient_id, 
                  count(*) as medication_count
          from medications
          group by patient_id)
,
pb as (
        select  patient_id, 
                count(*) as problem_count
        from problems
        group by patient_id)
,
med_claim as (
        select  memberid, 
                count(*) as med_claim_count
        from claims group by memberid)
,
rx_claim as (
              select  memberid, 
                      count(*) as rx_claim_count
from rx group by memberid)


select pat.patient_id, pat.first_name, pat.last_name, med.medication_count, pb.problem_count, med_claim.med_claim_count, rx_claim.rx_claim_count
from pat 
left join med on pat.patient_id = med.patient_id
left join pb on pat.patient_id = pb.patient_id
left join med_claim on pat.patient_id = med_claim.memberid
left join rx_claim on pat.patient_id = rx_claim.memberid
where row_num = 1


