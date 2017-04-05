InputGraph = LOAD '$I' USING PigStorage(',') AS (gsrc, gcost, gdest);
--J = JOIN MMatrix BY mcol FULL OUTER, NMatrix BY nrow;
InitGraph = FOREACH InputGraph GENERATE gsrc,gcost,gdest;
MidGraph = GROUP InitGraph BY gdest;
--MidGraph2 = FOREACH MidGraph GENERATE FLATTEN(group), (InitGraph.gcost,InitGraph.gsrc);
STORE MidGraph INTO '$O' USING PigStorage (',');
