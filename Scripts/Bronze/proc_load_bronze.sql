/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/
create or alter procedure bronze.load_bronze as 

begin

    declare @start_time datetime, @end_time datetime, @batch_start_time datetime,  @batch_end_time datetime;

   begin try

   set @batch_start_time = getdate();

	 print'===================================================='
	 print 'Loading Bronze layer'
	 print'===================================================='

	 print '==================================================='
	 print'bronze.CRM layer'
	 print '==================================================='

	 set @start_time = getdate();

	 print '>>truncating the table: bronze.crm_cust_info'
		truncate table bronze.crm_cust_info;

	 print '>>inserting data into the table: bronze.crm_cust_info'

		Bulk insert bronze.crm_cust_info
		from 'C:\Users\Ramup\Downloads\SQL\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm/cust_info.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			TABLOCK
		);

		
	 set @end_time = getdate();
	 
	 print '>> Load duration: ' + cast(datediff(second, @start_time, @end_time) as nvarchar) + 'seconds'; 

	 Print'-------------------------------'

	  set @start_time = getdate();

	 print '>>truncating the table: bronze.crm_prd_info'

		truncate table bronze.crm_prd_info;

	 print '>>inserting data into the table: bronze.crm_prd_info'

		Bulk insert bronze.crm_prd_info
		from 'C:\Users\Ramup\Downloads\SQL\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm/prd_info.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			TABLOCK
		);
			 set @end_time = getdate();
	 
	 print '>> Load duration: ' + cast(datediff(second, @start_time, @end_time) as nvarchar) + 'seconds'; 

	 Print'-------------------------------'

       set @start_time = getdate();

	 print '>>truncating the table: bronze.crm_sales_details'

		truncate table bronze.crm_sales_details;

		 print '>>inserting data into the table: bronze.crm_sales_details'

		Bulk insert bronze.crm_sales_details
		from 'C:\Users\Ramup\Downloads\SQL\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm/sales_details.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			TABLOCK
		);
				 set @end_time = getdate();
	 
	 print '>> Load duration: ' + cast(datediff(second, @start_time, @end_time) as nvarchar) + 'seconds'; 

	 Print'-------------------------------'
	

	 print '==================================================='
	 print'bronze.ERP layer'
	 print '==================================================='

        set @start_time = getdate();
   
	  print '>>truncating the table: bronze.erp_loc_a101'

		truncate table bronze.erp_loc_a101;

	  print '>>inserting data into the table: bronze.erp_loc_a101'

		Bulk insert bronze.erp_loc_a101
		from 'C:\Users\Ramup\Downloads\SQL\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp/loc_a101.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			TABLOCK
		);
				 set @end_time = getdate();
	 
	 print '>> Load duration: ' + cast(datediff(second, @start_time, @end_time) as nvarchar) + 'seconds'; 

	 Print'-------------------------------'
	
       set @start_time = getdate();
            

	 print '>>truncating the table: bronze.erp_cust_az12'

		truncate table bronze.erp_cust_az12;

	  print '>>inserting data into the table: bronze.erp_cust_az12'

		Bulk insert bronze.erp_cust_AZ12
		from 'C:\Users\Ramup\Downloads\SQL\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp/cust_AZ12.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			TABLOCK
		);
				 set @end_time = getdate();
	 
	 print '>> Load duration: ' + cast(datediff(second, @start_time, @end_time) as nvarchar) + 'seconds'; 

	 Print'-------------------------------'

	 set @start_time = getdate();
	
	  print '>>truncating the table: bronze.erp_px_cat_g1v2'

		truncate table bronze.erp_px_cat_g1v2;

	 print '>>inserting data into the table: bronze.erp_erp_px_cat_g1v2'

		Bulk insert bronze.erp_px_cat_g1v2
		from 'C:\Users\Ramup\Downloads\SQL\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp/px_cat_g1v2.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			TABLOCK
		);

				 set @end_time = getdate();
	 
	 print '>> Load duration: ' + cast(datediff(second, @start_time, @end_time) as nvarchar) + 'seconds'; 

	 Print'-------------------------------'

	 set @batch_end_time = getdate();
	 print'===================================='
	 print'bronze layer loading is completed'
	 print '--total Load duration: ' + cast(datediff(second, @batch_start_time, @batch_end_time) as nvarchar) + 'seconds'; 
end try
	begin catch
	print'=========================================================='

	print'error occured during loading of bronze layer'
	print'error message' + error_message();
	print 'error message' + cast(error_number()as nvarchar);
	print'error message' + cast(error_state() as nvarchar);

	print'=========================================================='

	end catch
end
