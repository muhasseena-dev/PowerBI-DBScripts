USE [Trinity Solar]
GO
/****** Object:  Table [dbo].[TSBT_BI_Metadata]    Script Date: 2021-10-20 5:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TSBT_BI_Metadata](
	[Table_Name] [varchar](250) NULL,
	[Column_Name] [varchar](100) NULL,
	[Type_Of_Column] [varchar](50) NULL,
	[Measured_Calculated] [varchar](100) NULL,
	[Measured_Calculated_Formula] [varchar](4000) NULL,
	[Column_Definition] [varchar](max) NULL,
	[Lookup_Table] [varchar](500) NULL,
	[Join_Condition] [varchar](500) NULL,
	[Execution_Order] [int] NULL,
	[Join_Type] [varchar](50) NULL,
	[Group_By_Condition] [varchar](500) NULL,
	[Identity_Column] [varchar](50) NULL,
	[Cycle] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [TSA].[ErrorLog]    Script Date: 2021-10-20 5:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TSA].[ErrorLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NULL,
	[ErrorNumber] [int] NULL,
	[ErrorState] [int] NULL,
	[ErrorLine] [int] NULL,
	[ErrorMessage] [varchar](max) NULL,
	[ErrorTime] [datetime] NULL,
	[TableName] [varchar](50) NULL,
	[ExecutionOrder] [int] NULL,
	[SP_Name] [varchar](200) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [TSA].[SalesForceControlTable_Log]    Script Date: 2021-10-20 5:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TSA].[SalesForceControlTable_Log](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SourceObject] [varchar](50) NULL,
	[LastLoadDate] [datetime] NULL,
	[RowsInserted] [int] NULL,
	[BeginTime] [datetime] NULL,
	[End_Time] [datetime] NULL,
	[Username] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [TSA].[spExecutionLog]    Script Date: 2021-10-20 5:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TSA].[spExecutionLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [varchar](50) NULL,
	[Execution_No] [int] NULL,
	[Start_Time] [datetime] NULL,
	[End_Time] [datetime] NULL,
	[RowsInserted] [int] NULL,
	[Username] [varchar](100) NULL,
	[Loaddate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [TSA].[update_query_metadata]    Script Date: 2021-10-20 5:10:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TSA].[update_query_metadata](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Table_Name] [nvarchar](100) NULL,
	[Query_Text] [nvarchar](max) NULL,
	[Execution_Order] [int] NULL,
	[Cycle] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO



/*------------------------------------ALTER TABLES IN TSA SCHEMA-----------------------------------------------*/

/*User*/

ALTER TABLE [TSA].[User] ADD	
	[Contact_Office] [varchar](100) NULL,
	[Contact_Division] [varchar](100) NULL,
	[Contact_Division_groups] [varchar](250) NULL,
	[Contact_Office_groups] [varchar](250) NULL,
	[Last_SP_Ran_Date] [datetime] NULL

/*Account*/

ALTER TABLE [TSA].[Account] ADD
	[Address] [nvarchar](500) NULL,
	[AHJ_Blanks] [bit] NULL,
	[BillingCityAndState] [nvarchar](500) NULL,
	[Duration_Range] [varchar](10) NULL,
	[Last_Eagleview_Ordered] [datetime] NULL,
	[Last_SP_Ran_Date] [datetime] NULL

/*Contact*/

 ALTER TABLE TSA.Contact ADD
	[Active_Direct] [varchar](10) NULL,
	[Active_Direct_Solar_Pro] [varchar](10) NULL,
	[Active_Outreach] [varchar](10) NULL,
	[Active_Trad_or_Direct] [varchar](10) NULL,
	[Active_Trad] [varchar](10) NULL,
	[Address] [nvarchar](1020) NULL,
	[User] [varchar](100) NULL,
	[Days_Employed_Groups] [varchar](100) NULL,
	[Division_and_Office] [varchar](100) NULL,
	[Referrals] [varchar](200) NULL,
	[Sales_Division] [nvarchar](200) NULL,
	[Sales_Division_Abbreviation] [nvarchar](1020) NULL,
	[Sales_Division_and_Sales_Rep_Name] [varchar](100) NULL,
	[Sales_State] [varchar](100) NULL,
	[Sales_Office__c_groups] [varchar](100) NULL,
	[Sales_Division__c_groups] [varchar](100) NULL,
	[Last_SP_Ran_Date] [datetime] NULL

/*Check_request*/


ALTER TABLE TSA.Check_request ADD
	[Oppt_Lead_Source] [varchar](100) NULL,
	[Created_Date_Time_w/_DST] [datetime] NULL,
	[Oppt_Referrer] [varchar](100) NULL,
	[Referrer] [nvarchar](400) NULL,
	[Last_SP_Ran_Date] [datetime] NULL




/*Task*/

ALTER TABLE TSA.Task ADD
    [Caller] [varchar](100) NULL,
	[Caller_Division] [varchar](100) NULL,
	[Caller_Office] [varchar](100) NULL,
	[Contact_Id] [varchar](100) NULL,
	[Created_Date_Time_w/DST] [datetime] NULL,
	[Last_SP_Ran_Date] [datetime] NULL


/*Project Track*/



ALTER TABLE TSA.Project_Track ADD
    [A_B_Timeline__Not_Rep_Control] [bit] NULL,
	[Business_Days_in_Track] [int] NULL,
	[Closed_Track] [varchar](50) NULL,
	[Created_By] [varchar](100) NULL,
	[Created_Date_w/_DST] [datetime] NULL,
	[Date_to_Close] [datetime] NULL,
	[Last_Modified_By] [varchar](100) NULL,	
	[Oppt_Reason_Lost] [varchar](50) NULL,
	[Ops_Responsible_Change_Order] [varchar](100) NULL,
	[Ops_Responsible_Electrical] [varchar](100) NULL,
	[Ops_Responsible_Installs_Timeline] [varchar](100) NULL,
	[Ops_Responsible_Oversized] [varchar](100) NULL,
	[Ops_Responsible_RSA] [varchar](100) NULL,
	[Ops_Responsible_Structural] [varchar](100) NULL,
	[Original_A_or_B] [int] NULL,	
	[Ops_Responsible_PSA] [nvarchar](100) NULL,
	[Rep_Control_Added_Days] [bit] NULL,
	[Ops_Responsible_Special] [nvarchar](100) NULL,
	[Original_Track] [nvarchar](100) NULL,
	[Original_Track_A] [varchar](50) NULL,
	[Original_Track_B] [varchar](50) NULL,
	[Original_Track_C] [varchar](50) NULL,
	[Original_Track_Under_Rep_Control] [varchar](50) NULL,
	[Rep_Control_Original_Project_Track_C] [int] NULL,
	[Rep_Control_Additional_Forms] [nvarchar](100) NULL,
	[Rep_Control_Contract_Issues] [bit] NULL,
	[Rep_Control_Design_Issues] [bit] NULL,
	[Rep_Control_Electric_Bill_Issues] [bit] NULL,
	[Rep_Control_Finance_Issues] [bit] NULL,
	[Rep_Control_Not_CF] [bit] NULL,
	[Rep_Control_Photo_Issues] [bit] NULL,
	[Track_C_Resolution_Review] [varchar](50) NULL,
	[Last_SP_Ran_Date] [datetime] NULL



/*Event*/


ALTER TABLE TSA.EVENT ADD
[Appt_Date] [datetime] NULL,
[Appt_Type] [nvarchar](1020) NULL,
[Appts_Ran] [nvarchar](1020) NULL,
[Assigned_To] [nvarchar](200) NULL,
[Assigned_To_Division] [nvarchar](200) NULL,
[Assigned_To_Office] [nvarchar](200) NULL,
[Chained_Contract] [nvarchar](50) NULL,
[Contact_Lead_Source] [nvarchar](1020) NULL,
[Contact_State] [nvarchar](1020) NULL,
[Contract] [nvarchar](1000) NULL,
[Contract_Signed] [varchar](100) NULL,
[Created_After_Ran] [varchar](10) NULL,
[Created_By] [nvarchar](200) NULL,
[Created_Date_w/DST] [datetime] NULL,	
[Division] [varchar](100) NULL,
[Event_End_Date_Time_w/DST] [datetime] NULL,
[Last_Appt_Date] [datetime] NULL,
[Lead] [nvarchar](100) NULL,
[Lead_Lead_Source] [varchar](100) NULL,
[Lead_Source] [nvarchar](1020) NULL,
[Lead_Source_Group] [nvarchar](200) NULL,
[Lead_State] [varchar](100) NULL,
[Customer_Name] [varchar](100) NULL,
[Not_Updated_Appts] [nvarchar](200) NULL,
[Office] [varchar](100) NULL,
[Oppt_Id] [varchar](200) NULL,
[Oppt_Stage] [varchar](100) NULL,
[Outcome_Groups] [varchar](100) NULL,
[Outcomes] [nvarchar](1020) NULL,
[Referral_and_Self_Gen_Appts_Ran] [varchar](100) NULL,
[Referral_Appts_Ran] [varchar](100) NULL,
[Rep_Assigned] [nvarchar](200) NULL,
[Sales_State] [varchar](10) NULL,
[State] [varchar](100) NULL,
[Unassigned_Appt] [varchar](20) NULL,
[Outcomes_groups_1] [nvarchar](1020) NULL,
[Outcome__c_groups] [nvarchar](1020) NULL,
[Last_SP_Ran_Date] [datetime] NULL



/**Lead*/

ALTER TABLE TSA.Lead ADD
[Actual_Lead_Source] [nvarchar](400) NULL,
[Actual_Reason_Lost] [nvarchar](400) NULL,
[Actual_State] [nvarchar](400) NULL,
[Actual_Territory] [nvarchar](400) NULL,
[Address] [nvarchar](800) NULL,
[Appt_Completed] [nvarchar](400) NULL,
[Appt_Confirmed] [bit] NULL,
[Call_Outcome] [nvarchar](200) NULL,
[Call_Owner] [nvarchar](200) NULL,
[Call_Referral] [nvarchar](200) NULL,
[Call_Referred] [nvarchar](200) NULL,
[Confirmation_from_Event] [nvarchar](2040) NULL,
[Confirmation_Using_Event_Date] [varchar](100) NULL,
[Contracts_Signed] [varchar](100) NULL,
[Converted] [bit] NULL,
[Covid_Email_Leads] [bit] NULL,
[Created_By] [varchar](100) NULL,
[Created_By_Division] [varchar](100) NULL,
[Created_By_Office] [varchar](100) NULL,
[Created_Date_Time_w/DST] [datetime] NULL,
[Created_Date_w/DST] [date] NULL,
[First_Appt_From_Event] [datetime] NULL,
[First_Appt_From_Oppt] [datetime] NULL,
[Appt_Date] [datetime] NULL,
[Appt_Scheduled] [bit] NULL,
[Division] [varchar](100) NULL,
[Disqualified] [int] NULL,
[Email_Owner] [varchar](100) NULL,
[Email_Referred] [bit] NULL,
[Email_Source] [varchar](100) NULL,
[Event_Appt_Confirmed] [varchar](100) NULL,	
[Finance_Partner] [varchar](100) NULL,
[First_Appt_Confirmation_Date] [datetime] NULL,
[Has_Email] [varchar](10) NULL,
[Has_Phone] [varchar](10) NULL,
[Install_Scheduled_Watts] [float] NULL,
[Install_Started] [bit] NULL,
[Installed_Watts] [float] NULL,
[Install_Scheduled] [bit] NULL,
[Lead_Gen] [varchar](100) NULL,
[Lead_Gen_Division] [varchar](100) NULL,
[Lead_Source_Lookup] [varchar](100) NULL,
[Lead_Time] [int] NULL,
[Lead_Gen_SalesPer] [varchar](100) NULL,
[Lost_Before_Appt_Ran] [bit] NULL,
[Managing_Office] [varchar](100) NULL,
[System_Size] [float] NULL,
[Task_Subject] [varchar](100) NULL,
[Total_Email_Leads] [varchar](100) NULL,
[Oppt_Reason_Lost] [varchar](50) NULL,
[Oppt_State] [nvarchar](400) NULL,	
[Oppt_Territory] [nvarchar](400) NULL,
[Oppt_Lost_Before_Appt_Ran] [bit] NULL,
[Reason_Lost] [varchar](100) NULL,
[Referral_Caller] [nvarchar](800) NULL,
[Referral_Caller_Division] [nvarchar](400) NULL,
[Referral_Caller_Office] [nvarchar](400) NULL,
[Referred_from_Campaign] [nvarchar](800) NULL,
[Referred_From_Email] [varchar](100) NULL,
[Referrer_Name] [nvarchar](200) NULL,
[Sales_Office] [nvarchar](200) NULL,
[Site_Quality] [varchar](100) NULL,
[State_Abbreviation] [nvarchar](100) NULL,
[Last_SP_Ran_Date] [datetime] NULL



/*Opportunity*/

ALTER TABLE TSA.Opportunity ADD
    [Appt_Date] [datetime] NULL,
	[Appts_Ran_count] [float] NULL,
	[Avoided_Rep_Control_Track_C] [bit] NULL,
	[Below_Target_Cash] [nvarchar](200) NULL,
	[Below_Target_Floor] [nvarchar](200) NULL,
	[Below_Target_Loan] [nvarchar](200) NULL,
	[Below_Target_Min] [nvarchar](200) NULL,
	[Below_Target_Rate] [nvarchar](200) NULL,
	[Business_Days_Contract_Signed_to_Submitted] [int] NULL,
	[Business_Days_Contract_to_Install] [int] NULL,
	[Business_Days_Contract_to_PTO] [int] NULL,
	[Count_Track_C] [float] NULL,
	[Day_of_Week] [nvarchar](200) NULL,
	[Demo_Scheduled] [bit] NULL,
	[Business_Days_Install_Complete_to_PTO] [int] NULL,
	[Business_Days_Installs_Started_to_Completed] [int] NULL,
	[Target_Cash] [nvarchar](200) NULL,
    [State] [nvarchar](400) NULL,
	[Trad_or_Direct] [nvarchar](200) NULL,
	[Installs_Started_to_Completed_seconds] [float] NULL,
	[Last_Appt_Before_Contract_Signed] [datetime] NULL,
	[Lead_Source_Lookup] [nvarchar](400) NULL,
	[Target_Loan] [float] NULL,
	[Completed_Before_DToFA] [nvarchar](400) NULL,
	[Contact_First_Name] [nvarchar](200) NULL,
	[Contact_Has_Phone] [nvarchar](200) NULL,
	[Contact_Last_Name] [nvarchar](200) NULL,
	[Contract_to_PTO_seconds] [float] NULL,
	[Direct_Points] [bit] NULL,
	[Division_and_Office] [nvarchar](800) NULL,
	[Rate_Escalator_Zero] [nvarchar](400) NULL,
	[Finance_Partner_] [nvarchar](400) NULL,
	[Target_Floor] [nvarchar](200) NULL,
	[Install_Scheduled_Completed] [nvarchar](200) NULL,
	[Install_Started] [bit] NULL,
	[Lost_Before_Appt] [bit] NULL,
	[Managing_Office] [nvarchar](400) NULL,
	[Latest_Appt_Ran_Date] [datetime] NULL,
	[Target_Rate] [float] NULL,
	[Target_Minimum] [nvarchar](200) NULL,
	[Multiplier] [bit] NULL,
	[Multiplier_Calc] [float] NULL,
	[Account_Street] [nvarchar](400) NULL,
	[Original_Project_Track] [nvarchar](200) NULL,
	[Original_Project_Track_Status] [nvarchar](200) NULL,
	[Original_Project_Track_Id] [nvarchar](200) NULL,
	[Pallet_Project] [bit] NULL,
	[AccountBillingCityAndState] [varchar](100) NULL,
	[PPA_Multiplier] [float] NULL,
	[PSA] [nvarchar](200) NULL,
	[Site_Quality] [int] NULL,
	[Oppt_Contact_Self_Gen] [bit] NULL,
	[State_Utility_Purchase] [nvarchar](400) NULL,
	[delta_Cash_Sys_Size] [float] NULL,
	[delta_Floor_Sys_Size] [float] NULL,
	[delta_Loan_Sys_Size] [float] NULL,
	[delta_Minimum_Sys_Size] [float] NULL,
	[Actual_Days_Contract_to_Install] [nvarchar](200) NULL,
	[Actual_Days_Install_Complete_to_PTO] [nvarchar](200) NULL,
	[Points_For_Non_Self_Gen_Contract] [int] NULL,
	[Actual_Lead_Source] [nvarchar](400) NULL,
	[Rep_Office] [nvarchar](400) NULL,
	[RSA_Requested_Before_DToFA] [nvarchar](400) NULL,
	[Resolution_Review_End] [datetime] NULL,
	[Resolution_Review_Start] [datetime] NULL,
	[Resolution_Specialist] [nvarchar](800) NULL,
	[Sales_Division_and_Sales_Rep] [nvarchar](400) NULL,
	[Amount_Minus_Credit_Fails] [nvarchar](400) NULL,
	[Commissionable_Amount_Minus_Credit_Fails] [float] NULL,
	[Sales_Office_State] [nvarchar](400) NULL,
	[Scheduled_to_PTO] [int] NULL,
	[Scheduled_Completed] [nvarchar](200) NULL,
	[Self_Gen_Contract_Points] [int] NULL,
	[Self_Gen_Referral_Contract_CF] [bit] NULL,
	[Signed_to_Submitted_seconds] [float] NULL,
	[Site_Assessment_Complete] [nvarchar](200) NULL,
	[StageNumber] [nvarchar](200) NULL,
	[Created_Contract_Count] [int] NULL,
	[State_Code] [nvarchar](80) NULL,
	[State_Utility] [nvarchar](400) NULL,
	[Stewardship_Account_Name] [nvarchar](800) NULL,
	[Submitted_to_Referral] [nvarchar](400) NULL,
	[delta_PPA_Sys_Size] [float] NULL,
	[System_Size_kW_Minus_Credit_Fails] [float] NULL,
	[System_Size_Watts] [float] NULL,
	[System_Size_Watts_Minus_Credit_Fails] [float] NULL,
	[Total_Points] [int] NULL,
	[Trad_Above_Rate_Bonus] [float] NULL,
	[Trad_Non_Self_Gen_Points] [float] NULL,
	[Trad_Self_Gen_Points] [int] NULL,
	[Trad_Total_Points] [float] NULL,
	[Under_Rep_Control] [float] NULL,
	[Under_Rep_Control_Track_C] [int] NULL,
	[Salesperson_User_Name] [nvarchar](400) NULL,
	[Address] [nvarchar](2000) NULL,
	[Utility_Updated] [nvarchar](200) NULL,
	[Winback_Slicer_Opp] [nvarchar](200) NULL,
	[delta_CPPW_Floor] [float] NULL,
	[delta_CPPW_Minimum] [float] NULL,
	[delta_rate_PPA] [float] NULL,
	[delta_CPPW_Cash] [float] NULL,
	[delta_CPPW_Loan] [float] NULL,
	[Has_Contact_Phone] [bit] NULL,
	[Has_Main_Phone] [bit] NULL,
	[Contract_Multiplier] [nvarchar](400) NULL,
	[Contract_Signed_CF] [nvarchar](400) NULL,
	[Contract_to_Install_Group] [nvarchar](200) NULL,
	[Days_to_Install] [int] NULL,
	[Days_to_PTO] [int] NULL,
	[Scheduled_not_Completed_Days_Groups] [nvarchar](200) NULL,
	[Contact_Lead_Source] [nvarchar](320) NULL,
	[Contact_Name] [nvarchar](800) NULL,
	[Contact_Phone] [nvarchar](200) NULL,
	[Do_Not_Call] [bit] NULL,
	[Eagleview_Status] [nvarchar](800) NULL,
	[Scheduled_not_Completed_Days] [int] NULL,
	[Demo_Date_Time_w_DST] [datetime] NULL,
	[PM_Groups] [nvarchar](400) NULL,	
	[Scheduled_not_Completed] [bit] NULL,
	[Actual_Less_Contract] [nvarchar](400) NULL,
	[Primary_contact_Email] [nvarchar](640) NULL,
	[Email_Opt_Out] [bit] NULL,
	[Employment_Status] [nvarchar](200) NULL,
	[Referral_Caller] [nvarchar](800) NULL,
	[Referral_Caller_Division] [nvarchar](400) NULL,	
	[Rep_Division] [nvarchar](400) NULL,
	[Complete_to_PTO_Days] [varchar](100) NULL,
	[Referral_Caller_Office] [nvarchar](400) NULL,
	[Install_Completed] [bit] NULL,
	[Install_Scheduled_CF] [bit] NULL,
	[Installed] [nvarchar](40) NULL,
	[LOI_Signed_Count] [nvarchar](40) NULL,
	[Contact_Email] [nvarchar](200) NULL,
	[Install_to_Complete] [varchar](100) NULL,
	[Complete_to_PTO_Group] [nvarchar](200) NULL,
	[Contract_to_Install_Days] [varchar](100) NULL,
	[Created_Date_Time_w_DST] [datetime] NULL,
	[Created_Date_w_DST] [datetime] NULL,
	[Division_Abbreviation] [nvarchar](200) NULL,
	[Oppt_Lead_Generator] [nvarchar](400) NULL,
	[Lost_No_Contract] [bit] NULL,
	[Sales_Rep] [nvarchar](400) NULL,
	[Above_EPC_Rate_Target] [float] NULL,
	[Above_EPC_target] [float] NULL,
	[Above_Rate_Target] [float] NULL,
	[Active_Project_Track] [nvarchar](144) NULL,
	[delta_Production_Estimate] [float] NULL,
	[Appt_Completed] [bit] NULL,
	[Appt_Scheduled] [bit] NULL,
	[Appt_After_Contract_Signed] [nvarchar](400) NULL,
	[Effective_Date] [datetime] NULL,
	[Division__c_groups] [nvarchar](400) NULL,
	[Direct_Sales_Office__c_groups] [nvarchar](400) NULL,
	[Last_SP_Ran_Date] [datetime] NULL



/*action item*/

ALTER TABLE TSA.Action_item ADD 
    [Action_Item_Business_Days] [int] NULL,
	[Date_Contract_Submitted] [datetime] NULL,
	[Eagleview_Available] [nvarchar](100) NULL,
	[AI_Pallet] [nvarchar](10) NULL,
	[Broken_Roof] [int] NULL,
	[Business_Days_Contract_Submitted_to_Resolutions_Review] [int] NULL,	
	[Not_Needed_or_Opp_Lost] [int] NULL,	
	[Business_Days_Resolutions_Review_End_to_Install] [int] NULL,
	[Completed_Date_w/_DST] [datetime] NULL,
	[Completed_DateTime_w/_DST] [datetime] NULL,
	[Completed_Time] [time](7) NULL,
	[Contracts_Resolutions_Review_to_Install_seconds] [float] NULL,
	[Contracts_Submitted_to_Resolutions_Review_seconds] [float] NULL,
	[Created_Date_w/_DST] [datetime] NULL,
	[Date_Contract_Signed] [datetime] NULL,
	[Install_Start] [datetime] NULL,
	[Non_Business_Days_Resolutions_Review_Start_to_End] [int] NULL,
	[Original_A_or_B_Res_Start_to_End] [int] NULL,
	[Personnel_Assigned_To] [nvarchar](100) NULL,
	[Pitch_Change] [int] NULL,
	[Pitch_Filter] [int] NULL,
	[Resolutions_Start_to_End] [int] NULL,
	[Resolutions_Start_to_End_in_seconds] [float] NULL,
	[RSA_Completed] [int] NULL,
	[Track_C_Days_Grouped] [nvarchar](100) NULL,
	[Winback_Commenced] [datetime] NULL,
	[Winback_Slicer] [nvarchar](100) NULL,
    [Last_SP_Ran_Date] [datetime] NULL

/*-----------------------------------------------------------------------------------------------------------*/
