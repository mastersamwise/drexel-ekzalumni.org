
-- drop view v_members_past_and_present;
create view v_members_past_and_present as
select 	m.full_name 		as name,
		i.zeta_number		as zetaNumber,
		i.initiation_year	as initiationYear,
        ms.member_status	as memberStatus,
        m.graduation_year	as graduationYear,
        cs.college_status	as collegeStatus
from members m
	left outer join lxa_info i on m.id = i.member_id
    left outer join member_status_enums ms on i.member_status_id = ms.id
    left outer join college_status_enums cs on m.college_status_id = cs.id
order by CAST(i.zeta_number as UNSIGNED) desc;