/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/
if object_id ('bronze.crm_cust_info', 'u') is not null 
 drop table bronze.crm_cust_info;

create table bronze.crm_cust_info(
	cst_id int,
	cst_key nvarchar(50),
	cst_firstname nvarchar(50),
	cst_lastname nvarchar(50),
	cst_marital_status nvarchar(50),
	cst_gndr nvarchar(50),
	cst_create_date date
)

Create table bronze.crm_prd_info(
	prd_id int,
	prd_key nvarchar(50),
	prd_nm  nvarchar(50),
	prd_cost int,
	prd_line nvarchar(50),
	prd_start_dt datetime,
	prd_end_dt datetime
);

create table  bronze.crm_sales_details(
	sls_ord_num nvarchar(50),
	sls_prd_key nvarchar(50),
	sls_cust_id int,
	sls_order_dt int,
	sls_ship_dt int,
	sls_due_dt int,
	sls_sales int,
	sls_quantity int,
	sls_price int
)

create table bronze.erp_cust_az12(
	CID nvarchar(50),
	BDATE date,
	GEN nvarchar(50)
)

create table bronze.erp_loc_a101(
	CID nvarchar(50),
	CNTRY nvarchar(50)
)

create table bronze.erp_px_cat_g1v2(
	ID nvarchar(50),
	CAT nvarchar(50),
	SUBCAT nvarchar(50),
	MAINTENANCE nvarchar(50)
)
