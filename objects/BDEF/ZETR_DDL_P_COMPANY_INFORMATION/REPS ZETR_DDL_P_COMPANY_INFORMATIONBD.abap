projection;
strict ( 2 );

define behavior for zetr_ddl_p_company_information //alias <alias_name>
{
  use create;
  use update;
  use delete;

  use association _companyIdentification { create; }
  use association _companyParameters { create; }
}

define behavior for zetr_ddl_p_company_identify //alias <alias_name>
{
  use update;
  use delete;

  use association _companyInformation;
}

define behavior for zetr_ddl_p_company_parameters //alias <alias_name>
{
  use update;
  use delete;

  use association _companyInformation;
}