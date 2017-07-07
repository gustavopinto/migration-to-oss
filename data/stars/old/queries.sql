select isoWeekYear, isoWeek, stargazers_count, stargazers_sum
from WeeklyStargazers where repository = 455600 order by isoWeekYear
INTO OUTFILE '/usr/local/output/hhvm.csv' FIELDS TERMINATED BY ',';

select isoWeekYear, isoWeek, stargazers_count, stargazers_sum
from WeeklyStargazers where repository = 3228505 order by isoWeekYear
INTO OUTFILE '/usr/local/output/atom.csv' FIELDS TERMINATED BY ',';

select isoWeekYear, isoWeek, stargazers_count, stargazers_sum
from WeeklyStargazers where repository = 14135470 order by isoWeekYear
INTO OUTFILE '/usr/local/output/storm.csv' FIELDS TERMINATED BY ',';

select isoWeekYear, isoWeek, stargazers_count, stargazers_sum
from WeeklyStargazers where repository = 29078997 order by isoWeekYear
INTO OUTFILE '/usr/local/output/roslyn.csv' FIELDS TERMINATED BY ',';

select isoWeekYear, isoWeek, stargazers_count, stargazers_sum
from WeeklyStargazers where repository = 44838949 order by isoWeekYear
INTO OUTFILE '/usr/local/output/swift.csv' FIELDS TERMINATED BY ',';

% ------------------- Novos
select isoWeekYear, isoWeek, stargazers_count, stargazers_sum
from WeeklyStargazers where repository = 2278524 order by isoWeekYear
INTO OUTFILE '/usr/local/output/hubot.csv' FIELDS TERMINATED BY ',';

select isoWeekYear, isoWeek, stargazers_count, stargazers_sum
from WeeklyStargazers where repository = 3567641 order by isoWeekYear
INTO OUTFILE '/usr/local/output/zxcvbn.csv' FIELDS TERMINATED BY ',';

select isoWeekYear, isoWeek, stargazers_count, stargazers_sum
from WeeklyStargazers where repository = 43160685 order by isoWeekYear
INTO OUTFILE '/usr/local/output/zulip.csv' FIELDS TERMINATED BY ',';
