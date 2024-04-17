
INSERT 
  INTO #project_id.#stg_dbe.D_DEV_INST_STG
  (
    DEV_INST_ID ,
    DEV_INST_DEV_TYPE_ID ,
    DEV_INST_IMEI ,
    DEV_INST_TAC_NUM ,
    DEV_IMEI_SERIAL_NUM ,
    GLB_DEV_TYPE_ID ,
    DEV_WARRANTY_START_DT ,
    REMORSE_PRD_END_DT ,
    REMORSE_PRD_START_DT ,
    DEV_WARRANTY_END_DT ,
    DEV_INST_PURCHASE_DT ,
    DEV_LOYALTY_POINTS_IND ,
    DEV_TOTL_INSTL_CNT ,
    DEV_PAY_MEANS_DESC ,
    DEV_PAY_MEANS_CD ,
    IS_KASKO_INSURANCE_USED ,
    IS_CAMP_RESULT ,
    IS_FULL_PRE_DISCNT ,
    IS_VF_OWNED ,
    CAMP_ID ,
    ACTVA_POS_ID ,
    ACTVA_SC_ID ,
    SOURCE_SYSTEM_ID ,
    DELETE_INDICATOR ,
    ROW_UPDATE_TIME ,
    SOURCE_UPDATE_TIME ,
    SOURCE_QUERY_TIME ,
    DPTI_ID ,
    IS_DELETED ,
    P_TIME ,
    REPL_TIMESTAMP ,
    BATCH_ID ,
    ETL_CRD_DT ,
    ETL_UPD_DT ,
    DEV_INST_COMITMENT_START_DT ,
    DEV_INST_COMITMENT_END_DT ,
    DEV_INST_UFRT_AMT ,
    DEV_INST_LEGAL_INVOICE_NUM ,
    DEV_INST_FST_PRD_INSTL_AMT ,
    IS_TNP_IN_BUNDLE ,
    CALL_CENTER_TEAM_CD ,
    CALL_CENTER_CD ,
    CALL_CENTER_MICRO_TEAM_CD ,
    DEV_INST_FULL_SALE_AMT ,
    DEV_INST_FULL_SALE_VAT_AMT ,
    DDT_NUM ,
    DEV_INST_FST_PRD_INSTL_CNT ,
    IS_COMPASS_FINANCING_DEV ,
    DEV_SALE_DISCNT_AMT ,
    IS_PRE_DEV ,
    IS_FULL_POSTPAID_DISCNT ,
    IS_SMART_WATCH ,
    SKU ,
    CREDIT_DEV_INRS_RATE ,
    CREDIT_DEV_INRS_AMT ,
    FST_TIME_FLEX_OPEN_IND ,
    IS_COMPASS_FLEXY_PAY_FINANCING_DEV ,
    IS_COMPASS_FLEX_FINANCING_DEV ,
    CREDIT_LINE_BAL_UPDT_DT ,
    REMAINING_INSTL_AMT ,
    DEV_INSTL_CNT ,
    INSTL_IN_PROGRESS_CNT ,
    FLEX_CAMP_CD ,
    TAN_RATE 
  ) 
SELECT 
  ASS.IMEI_GK ,
  ASS.DEVICE_TYPE_ID ,
  ASS.IMEI ,
  (LEFT(ASS.IMEI,8)) ,
  ASS.IMEI ,
  ASS.GLB_DEV_TYPE_ID ,
  (CAST(SUBSTR(CAST(ASS.WARRANTYSTARTDATE AS VARCHAR(20)),1,10)AS DATE)) ,
  (CAST(SUBSTR(CAST(ASS.REMORSEPERIODENDDATE AS VARCHAR(20)),1,10)AS DATE)) ,
  (CAST(SUBSTR(CAST(ASS.REMORSEPERIODSTARTDATE AS VARCHAR(20)),1,10)AS DATE)) ,
  (CAST(SUBSTR(CAST(ASS.WARRANTYENDDATE AS VARCHAR(20)),1,10)AS DATE)) ,
  (CAST(SUBSTR(CAST(ASS.DEVICEPURCHASEDATE AS VARCHAR(20)),1,10)AS DATE)) ,
  ASS.LOYALTYPOINTACQUISITIONIND ,
  ASS.TOTALNUMBEROFINSTALLMENTS ,
  ASS.DEV_PAY_MEANS_DESC ,
  ASS."DEV_PAY_MEANS_CD " ,
  ASS.ISKASKOINSURANCEUSED ,
  ASS.IS_CAMP_RESULT ,
  ASS.IS_FULL_PRE_DISCNT ,
  ASS.IS_VF_OWNED ,
  ASS.CAMPAIGNKEY ,
  ASS.DEALERKEY ,
  ASS.ACTVA_SC_ID ,
  ASS.SOURCE_SYSTEM_ID ,
  ASS.DELETE_INDICATOR ,
  ASS.ROW_UPDATE_TIME ,
  ASS.SOURCE_UPDATE_TIME ,
  ASS.SOURCE_QUERY_TIME ,
  ASS.DPTI_ID ,
  ASS.IS_DELETED ,
  ASS.P_TIME ,
  ASS.REPL_TIMESTAMP ,
  (#batch_id) ,
  CURRENT_TIMESTAMP(0) ,
  CURRENT_TIMESTAMP(0) ,
  ASS.COMMITSTARTDATE ,
  ASS.COMMITENDDATE ,
  ASS.DEV_INST_UFRT_AMT ,
  ASS.DEV_INST_LEGAL_INVOICE_NUM ,
  ASS.DEV_INST_FST_PRD_INSTL_AMT ,
  ASS.ORDERACTIONTYPEDESC ,
  COALESCE(ASS.CALL_CENTER_TEAM_CD,'-1') ,
  COALESCE(ASS.CALL_CENTER_CD,'-1') ,
  COALESCE(ASS.CALL_CENTER_MICRO_TEAM_CD,'-1') ,
  ASS.DEV_INST_FULL_SALE_AMT ,
  ASS.DEV_INST_FULL_SALE_VAT_AMT ,
  ASS.DDTNUMBER ,
  ASS.DEV_INST_FST_PRD_INSTL_CNT ,
  ASS.IS_COMPASS_FINANCING_DEV ,
  ASS.DEV_SALE_DISCNT_AMT ,
  ASS.IS_PRE_DEV ,
  ASS.IS_FULL_POSTPAID_DISCNT ,
  ASS.IS_SMART_WATCH ,
  ASS.SKU ,
  ASS.CREDIT_DEV_INRS_RATE ,
  ASS.CREDIT_DEV_INRS_AMT ,
  ASS.FST_TIME_FLEX_OPEN_IND ,
  ASS.IS_COMPASS_FLEXY_PAY_FINANCING_DEV ,
  ASS.IS_COMPASS_FLEX_FINANCING_DEV ,
  ASS.CREDIT_LINE_BAL_UPDT_DT ,
  ASS.REMAINING_INSTL_AMT ,
  ASS.DEV_INSTL_CNT ,
  ASS.INSTL_IN_PROGRESS_CNT ,
  ASS.FLEX_CAMP_CD ,
  ASS.TAN_RATE  
FROM 
  (
SELECT 
  ASSIGNEDPRODUCT.EQUIPMENTCATALOGKEY EQUIPMENTCATALOGKEY	
, ASSIGNEDPRODUCT.IMEI IMEI
, ASSIGNEDPRODUCT.IMEI_GK IMEI_GK			
, DEVICETYPE.DEV_TYPE_ID DEVICE_TYPE_ID
, GLBLDEVICE.GLB_DEV_TYPE_ID GLB_DEV_TYPE_ID
, ASSIGNEDPRODUCT.WARRANTYSTARTDATE WARRANTYSTARTDATE
, ASSIGNEDPRODUCT.REMORSEPERIODSTARTDATE REMORSEPERIODSTARTDATE
, ASSIGNEDPRODUCT.REMORSEPERIODENDDATE REMORSEPERIODENDDATE
, ASSIGNEDPRODUCT.WARRANTYENDDATE WARRANTYENDDATE
, ASSIGNEDPRODUCT.DEVICEPURCHASEDATE DEVICEPURCHASEDATE
, ASSIGNEDPRODUCT.LOYALTYPOINTACQUISITIONIND LOYALTYPOINTACQUISITIONIND
, CASE WHEN UPPER(ASSIGNEDPRODUCT.PAYMENTMETHODCODE) like '%FLEX%' 
THEN FCRE.DEV_TOTL_INSTL_CNT 
ELSE ASSIGNEDPRODUCT.TOTALNUMBEROFINSTALLMENTS 
END AS TOTALNUMBEROFINSTALLMENTS 
, CASE WHEN UPPER(ASSIGNEDPRODUCT.PAYMENTMETHODCODE) like '%COMPASS%' THEN 'Compass' 
WHEN UPPER(ASSIGNEDPRODUCT.PAYMENTMETHODCODE) like '%FLEX%' THEN 'Flex' 
    ELSE PYMTMTD.PAY_MEANS_DESC END AS DEV_PAY_MEANS_DESC 
, CASE WHEN UPPER(ASSIGNEDPRODUCT.PAYMENTMETHODCODE) like '%COMPASS%' THEN 'Compass' 
WHEN UPPER(ASSIGNEDPRODUCT.PAYMENTMETHODCODE) like '%FLEX%' THEN 'Flex' 
  ELSE PYMTMTD.PAY_MEANS_CD END AS DEV_PAY_MEANS_CD 
, ASSIGNEDPRODUCT.CAMPAIGNKEY
, CASE WHEN ASSIGNEDPRODUCT.CAMPAIGNKEY IS NOT NULL AND ASSIGNEDPRODUCT.CAMPAIGNKEY<> -2 THEN 1 ELSE 0 END AS IS_CAMP_RESULT
, CASE WHEN UPPER(ASSIGNEDPRODUCT.ORDERACTIONTYPEDESC) LIKE '%PROVIDE%' THEN 1 ELSE 0 END AS ORDERACTIONTYPEDESC 
,CASE WHEN UPPER(ASSIGNEDPRODUCT.PAYMENTMETHODCODE) like '%FLEX%' THEN CAST(ASSIGNEDPRODUCT.STARTDATE AS DATE) 
ELSE APP.COMMITSTARTDATE END AS COMMITSTARTDATE 
, CASE WHEN UPPER(ASSIGNEDPRODUCT.PAYMENTMETHODCODE) like '%FLEX%' THEN CAST(ADD_MONTHS(ASSIGNEDPRODUCT.STARTDATE,FCRE.DEV_TOTL_INSTL_CNT) - INTERVAL '1' DAY AS DATE) 
ELSE APP.COMMITENDDATE END AS COMMITENDDATE 
, ASSIGNEDPRODUCT.DEALERKEY
, CASE WHEN ASSIGNEDPRODUCT.ATTRIBUTELIST LIKE '%Kasko_Included_Next_R07+Y%' THEN 1 ELSE 0 END AS ISKASKOINSURANCEUSED
,ACT1.AR_FULL_INVOICE_NUM  DEV_INST_LEGAL_INVOICE_NUM
,CASE WHEN UPPER(ASSIGNEDPRODUCT.PAYMENTMETHODCODE) like '%FLEX%' THEN COALESCE(FCRE.DEV_INST_UFRT_AMT,0) 
ELSE COALESCE(ACT2.UFRT_AMT,0) END AS DEV_INST_UFRT_AMT 
,CASE WHEN UPPER(ASSIGNEDPRODUCT.PAYMENTMETHODCODE) like '%FLEX%' THEN COALESCE(FCRE.DEV_INST_INSTL_AMT,0) 
ELSE COALESCE(ACT2.FST_PRD_INSTL_AMT,0) END AS DEV_INST_FST_PRD_INSTL_AMT 
, ASSIGNEDPRODUCT.SOURCE_SYSTEM_ID
, ASSIGNEDPRODUCT.DELETE_INDICATOR	
, ASSIGNEDPRODUCT.ROW_UPDATE_TIME	
, ASSIGNEDPRODUCT.SOURCE_UPDATE_TIME	
, ASSIGNEDPRODUCT.SOURCE_QUERY_TIME	
, ASSIGNEDPRODUCT.DUMMY_INDICATOR    
, ASSIGNEDPRODUCT.DPTI_ID            
, ASSIGNEDPRODUCT.IS_DELETED			
, ASSIGNEDPRODUCT.P_TIME             
, ASSIGNEDPRODUCT.FILE_NM            	
, ASSIGNEDPRODUCT.REPL_TIMESTAMP     	
, ASSIGNEDPRODUCT.ERR_IND
,CASE WHEN COALESCE(ACT.IS_DEV_SCONTE_MERCE,0) = 1 AND  SUB.PYMT_CGY_CD<>'POST'  THEN 1 ELSE 0 END AS  IS_FULL_PRE_DISCNT
,CASE WHEN COALESCE(ACT.IS_DEV_SCONTE_MERCE,0) = 0 THEN ACT.GROSS_AMT ELSE 0 END AS    DEV_SALE_DISCNT_AMT
,CASE WHEN ( ( UPPER(COALESCE(ASSIGNEDPRODUCT.PAYMENTMETHODCODE,'-1')) not like '%COMPASS%' ) and
( (ASSIGNEDPRODUCT.ATTRIBUTELIST like '%;Dealer_Owned_Indicator_Next_R07+Y%' OR ASSIGNEDPRODUCT.ATTRIBUTELIST like 'Dealer_Owned_Indicator_Next_R07+Y%') or ( DSC1.SC_TYPE_CD='RT' and ASSIGNEDPRODUCT.ATTRIBUTELIST like '%New_Dealer_Owned_Indicator_Next_R07+Y%')) ) THEN 0 ELSE 1 END AS IS_VF_OWNED 
,CASE WHEN  SUB.PYMT_CGY_CD='POST' THEN 0 ELSE 1 END AS IS_PRE_DEV
,CASE WHEN ACT.IS_DEV_SCONTE_MERCE is not NULL AND  SUB.PYMT_CGY_CD='POST'  THEN 1 ELSE 0 END AS  IS_FULL_POSTPAID_DISCNT
,#batch_id AS BATCH_ID 
,DSC.SC_ID AS ACTVA_SC_ID 
,CASE WHEN DSC.SC_TYPE_CD='CC' THEN EMP2.CALL_CENTER_CD END CALL_CENTER_CD
,CASE WHEN DSC.SC_TYPE_CD='CC' THEN EMP2.CALL_CENTER_TEAM_CD END CALL_CENTER_TEAM_CD
,CASE WHEN DSC.SC_TYPE_CD='CC' THEN EMP2.CALL_CENTER_MICRO_TEAM_CD END CALL_CENTER_MICRO_TEAM_CD
,CASE WHEN UPPER(ASSIGNEDPRODUCT.PAYMENTMETHODCODE) like '%FLEX%' THEN FCRE.DEV_INST_FULL_SALE_AMT 
ELSE COALESCE(ACT2.NET_AMT            ,0)+ 
COALESCE(ACT2.TAX_AMT            ,0) END AS DEV_INST_FULL_SALE_AMT 
,COALESCE(ACT2.TAX_AMT            ,0)  DEV_INST_FULL_SALE_VAT_AMT 
,ASSIGNEDPRODUCT.DDTNUMBER AS  DDTNUMBER  
,COALESCE(ar.FST_PRD_INSTL_CNT,0) as  DEV_INST_FST_PRD_INSTL_CNT 
,CASE WHEN UPPER(ASSIGNEDPRODUCT.PAYMENTMETHODCODE) LIKE '%COMPASS_1' 
OR UPPER(ASSIGNEDPRODUCT.PAYMENTMETHODCODE) LIKE '%FLEX%' 
THEN 1 ELSE 0 END AS IS_COMPASS_FINANCING_DEV 
,CASE WHEN LOWER (DEVICETYPE.DEV_TYPE_OPER_SYS) LIKE 'watch%' THEN 1 ELSE 0 END AS IS_SMART_WATCH 
,CASE WHEN ABNBP.SKU1 IS NOT NULL THEN ABNBP.SKU1 
              WHEN APP_SKU.SKU2 IS NOT NULL THEN APP_SKU.SKU2
              ELSE NULL END AS SKU
,FCRE.CREDIT_DEV_INRS_RATE AS CREDIT_DEV_INRS_RATE 
,FCRE.CREDIT_DEV_INRS_AMT AS CREDIT_DEV_INRS_AMT 
,FCRE.FST_TIME_FLEX_OPEN_IND AS FST_TIME_FLEX_OPEN_IND 
,CASE WHEN UPPER(ASSIGNEDPRODUCT.PAYMENTMETHODCODE) like '%COMPASS%' 
THEN 1 
ELSE 0 
END AS IS_COMPASS_FLEXY_PAY_FINANCING_DEV 
,CASE WHEN UPPER(ASSIGNEDPRODUCT.PAYMENTMETHODCODE) like '%FLEX%' 
THEN 1 
ELSE 0 
END AS IS_COMPASS_FLEX_FINANCING_DEV
,TRUNC(CPU.LASTBALANCEUPDATEDATE) 	AS CREDIT_LINE_BAL_UPDT_DT
,COALESCE(CPU.REMAININGINSTALLMENTAMOUNT,0) 	AS REMAINING_INSTL_AMT
,CPU.DEVICEINSTALLMENTCOUNT 		AS DEV_INSTL_CNT
,CPU.INSTALLMENTINPROGRESSCOUNT 	AS INSTL_IN_PROGRESS_CNT
,COALESCE(CPU.CAMPAIGNCODE,'-1') 	AS FLEX_CAMP_CD
,CPU.TANRATE 					 	AS TAN_RATE 
 FROM #data_project_id.#ds_replication.ASSIGNEDPRODUCT_RA ASSIGNEDPRODUCT
left join #data_project_id.#vid_dbe.F_AR_ACTV_E ar 
on ar.CUST_ORD_ITEM_ACT_ID = ASSIGNEDPRODUCT.ORDERACTIONKEY
and ar.DEV_INST_ID = ASSIGNEDPRODUCT.IMEI_GK
and ar.UFRT_IND='N' 
and ar.DEBIT_GRP_CD='I'
and ar.AR_ACTV_CHRG_TYPE_DESC='Device' 
LEFT JOIN (SELECT * FROM #data_project_id.#vid_dbe.ASSIGNEDPRODUCT_PT WHERE  
ASSIGNEDPRODUCTSTATEKEY='AS' AND ASSIGNEDPRODUCTSTATUSKEY='AC' AND CAST(PRODUCTCATALOGKEY AS FLOAT)=(SELECT VAR_VALUE+622887 FROM #data_project_id.#vid_dbe.SOURCE_IDENT_VAR WHERE VAR_TYPE='BIGINT')
QUALIFY ROW_NUMBER() OVER (PARTITION BY PARENTASSIGNEDPRODUCTID, ASSIGNEDMAINCOMPONENTID ORDER BY BSSCREATIONDATE DESC,
BSSMODIFICATIONDATE DESC, REPL_TIMESTAMP DESC ) =1) APP
ON ASSIGNEDPRODUCT.PARENTASSIGNEDPRODUCTID=APP.PARENTASSIGNEDPRODUCTID
AND ASSIGNEDPRODUCT.ASSIGNEDMAINCOMPONENTID=APP.ASSIGNEDMAINCOMPONENTID
LEFT JOIN #data_project_id.#vid_dbe.F_AR_ACTV_E ACT 
ON ACT.DEV_INST_ID = ASSIGNEDPRODUCT.IMEI_GK 
AND  ACT.SUBR_ID = ASSIGNEDPRODUCT.SUBSCRIBERKEY AND ACT.SUBR_OWN_ID=ASSIGNEDPRODUCT.CUSTOMERKEY AND ACT.BILL_DOC_TYPE_CD ='DSC' 
LEFT JOIN (SELECT AR_FULL_INVOICE_NUM,DEV_INST_ID,CUST_ORD_ITEM_ACT_ID,AR_ACTV_CHRG_TYPE_DESC,DEBIT_GRP_CD 
			FROM #data_project_id.#vid_dbe.F_AR_ACTV_E
			WHERE AR_FULL_INVOICE_NUM IS NOT NULL
			AND UPPER(AR_ACTV_CHRG_TYPE_DESC)='DEVICE'
			AND DEBIT_GRP_CD='I' AND BILL_DOC_TYPE_CD = 'DBT'
			QUALIFY ROW_NUMBER() OVER (PARTITION BY AR_ACTV_UNIQUE_NUM,AR_ACTV_TYPE_CD 
			ORDER BY SOURCE_UPDATE_TIME DESC, ROW_UPDATE_TIME DESC) =1) ACT1
ON ACT1.DEV_INST_ID = ASSIGNEDPRODUCT.IMEI_GK   
AND (ACT1.CUST_ORD_ITEM_ACT_ID=ASSIGNEDPRODUCT.ORDERACTIONKEY OR 
(COALESCE(ACT1.CUST_ORD_ITEM_ACT_ID,-1) < 0 AND COALESCE(ASSIGNEDPRODUCT.ORDERACTIONKEY,-1) < 0)) 
LEFT JOIN #data_project_id.#vid_dbe.F_AR_ACTV_E ACT2 ON CAST(ACT2.IMEI AS VARCHAR(255))=CAST(ASSIGNEDPRODUCT.IMEI_GK AS VARCHAR(255)) AND  coalesce(ACT2.CUST_ORD_ITEM_ACT_ID,-1)=coalesce(ASSIGNEDPRODUCT.ORDERACTIONKEY ,-1)
AND ACT2.UFRT_IND='N' AND ACT2.DEBIT_GRP_CD='I' AND UPPER(ACT2.AR_ACTV_CHRG_TYPE_DESC)='DEVICE'
LEFT JOIN #data_project_id.#vid_dbe.ORDER_PT OP 
ON OP.ORDERKEY=ASSIGNEDPRODUCT.ORDERKEY
LEFT JOIN #data_project_id.#vid_dbe.D_SC DSC 
ON DSC.SC_NUM= OP.INITIALSALESCHANNELKEY
LEFT JOIN #data_project_id.#vid_dbe.D_DEV_TYPE DEVICETYPE ON DEVICETYPE.DEV_TYPE_ID=ASSIGNEDPRODUCT.EQUIPMENTCATALOGKEY AND DEVICETYPE.DEV_TYPE_NUM=cast(ASSIGNEDPRODUCT.EQUIPMENTCATALOGKEY as varchar(255))
LEFT JOIN #data_project_id.#vid_dbe.D_GLB_DEV_TYPE GLBLDEVICE ON GLBLDEVICE.GLB_DEV_TYPE_TAC_NUM=LEFT(ASSIGNEDPRODUCT.IMEI,8)
LEFT JOIN #data_project_id.#vid_dbe.D_PAY_MEANS PYMTMTD ON PYMTMTD.PAY_MEANS_CD = (CASE WHEN ASSIGNEDPRODUCT.PAYMENTMETHODCODE LIKE '%BA' THEN 'DD'   WHEN  ASSIGNEDPRODUCT.PAYMENTMETHODCODE  LIKE '%CC'  THEN  'CC'  END )
LEFT JOIN #data_project_id.#vid_dbe.ORDERACTION_PT OA
ON ASSIGNEDPRODUCT.ORDERACTIONKEY=OA.ORDERACTIONKEY
LEFT JOIN #data_project_id.#vid_dbe.D_EMP EMP2
ON EMP2.EMP_NUM=CAST(OA.CREATOREMPLOYEEKEY AS BIGINT)
LEFT JOIN #data_project_id.#vid_dbe.D_SUBR SUB ON SUB.SUBR_ID=ASSIGNEDPRODUCT.SUBSCRIBERKEY    
LEFT JOIN #data_project_id.#vid_dbe.D_SC DSC1 ON DSC1.SC_NUM =ASSIGNEDPRODUCT.SALESCHANNELKEY
LEFT JOIN (SELECT ASSIGNEDMAINCOMPONENTID,
CAST(SUBSTR(ASSIGNEDBILLINGOFFERATTRIBUTELIST, INSTR(ASSIGNEDBILLINGOFFERATTRIBUTELIST, 'Specific_SKU_Next_R1+') +21,
INSTR(SUBSTR(ASSIGNEDBILLINGOFFERATTRIBUTELIST||';', INSTR(ASSIGNEDBILLINGOFFERATTRIBUTELIST, 'Specific_SKU_Next_R1+')+21), ';') -1) AS VARCHAR(50)) AS SKU1
FROM #data_project_id.#vid_dbe.ASSIGNEDBILLINGOFFER_NBP_PT 
WHERE PRODUCTCATALOGKEY IN (938187, 938287) AND INSTR(ASSIGNEDBILLINGOFFERATTRIBUTELIST,'Specific_SKU_Next_R1+') >=0
AND ASSIGNEDBILLINGOFFERATTRIBUTELIST LIKE '%Specific_SKU_Next_R1+%'
QUALIFY ROW_NUMBER() OVER (PARTITION BY ASSIGNEDMAINCOMPONENTID ORDER BY BSSCREATIONDATE DESC, BSSMODIFICATIONDATE DESC, REPL_TIMESTAMP DESC ) =1 )ABNBP
ON ABNBP.ASSIGNEDMAINCOMPONENTID =ASSIGNEDPRODUCT.ASSIGNEDMAINCOMPONENTID
LEFT JOIN (SELECT SEQ_ID,OFFER_MOVNT_VER,OFFER_PARM_VAL AS SKU2,OFFER_PARM_DESC
FROM #data_project_id.#vid_dbe.F_SUBR_OFFER_PARM_E FSOP1
INNER JOIN #data_project_id.#vid_dbe.D_OFFER_PARM DOFR
ON FSOP1.OFFER_PARM_CD=DOFR.OFFER_PARM_CD
WHERE
DOFR.OFFER_PARM_DESC LIKE '%SKU%' AND OFFER_PARM_VAL IS NOT NULL) APP_SKU
ON APP_SKU.SEQ_ID = ASSIGNEDPRODUCT.ASSIGNEDPRODUCTID 
 AND ASSIGNEDPRODUCT.ASSIGNEDPRODUCTVERSIONID = APP_SKU.OFFER_MOVNT_VER 
LEFT JOIN #data_project_id.#vid_dbe.F_CREDIT_RESP_E FCRE 
ON FCRE.CUST_ORD_ITEM_ACT_ID=ASSIGNEDPRODUCT.ORDERACTIONKEY 
AND FCRE.DEV_INST_ID=ASSIGNEDPRODUCT.IMEI_GK
LEFT JOIN (SELECT LASTBALANCEUPDATEDATE ,REMAININGINSTALLMENTAMOUNT ,DEVICEINSTALLMENTCOUNT ,INSTALLMENTINPROGRESSCOUNT ,CAMPAIGNCODE ,TANRATE,DEVICEIMEI FROM #data_project_id.#vid_dbe.COMPASSPERIODUPDATE_PT
QUALIFY ROW_NUMBER() OVER (PARTITION BY DEVICEIMEI ORDER BY LASTBALANCEUPDATEDATE DESC)=1)CPU 
ON CPU.DEVICEIMEI=ASSIGNEDPRODUCT.IMEI
WHERE (ASSIGNEDPRODUCT.REPL_TIMESTAMP >= CAST('#start_time' AS TIMESTAMP(0)) AND ASSIGNEDPRODUCT.REPL_TIMESTAMP <=  CAST('#end_time' AS TIMESTAMP(0))) AND ASSIGNEDPRODUCT.IMEI IS NOT NULL AND ASSIGNEDPRODUCT.EQUIPMENTCATALOGKEY IS NOT NULL  
AND ASSIGNEDPRODUCT.ASSIGNEDPRODUCTSTATEKEY='AS' AND ASSIGNEDPRODUCT.ASSIGNEDPRODUCTSTATUSKEY='AC'  
QUALIFY ROW_NUMBER() OVER (PARTITION BY ASSIGNEDPRODUCT.ASSIGNEDPRODUCTID ORDER BY ASSIGNEDPRODUCT.BSSCREATIONDATE DESC,  
ASSIGNEDPRODUCT.BSSMODIFICATIONDATE DESC, ASSIGNEDPRODUCT.REPL_TIMESTAMP DESC ) =1
) ASS    
