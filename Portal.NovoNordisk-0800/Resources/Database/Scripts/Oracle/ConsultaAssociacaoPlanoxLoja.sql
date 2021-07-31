SELECT
  *
FROM
  PBM_AUT.TBGBM_C36_ATEN a
WHERE
  a.C36_NI_COD_PLN = 43461
  AND a.C36_NI_COD_LOJ in (
    select
      xlj.IS_XLJ
    FROM
      PBM_AUT.T_XLJ xlj
    WHERE
      XLJ.IS_XLJ_RED = 79105
      AND xlj.IS_XLJ = 79243
  )
