create database db_sewaherbs
use db_sewaherbs

/*product_category_master*/
create table product_category_master
(
   product_category_Id int identity(1,1) primary key,
   product_category_name varchar(250) not null unique,
   IsLiveProductCategory bit,
   date_added datetime default getdate(),
   added_by_fk uniqueidentifier,
   date_modified datetime default getdate(),
   modified_by_fk uniqueidentifier
)

create procedure add_a_product_category
(
  
   @product_category_name varchar(250),
   @IsLiveProductCategory bit,
   @user_Id uniqueidentifier
)
as
begin
  if not exists(select * from product_category_master where product_category_name=@product_category_name)
    begin
      insert into product_category_master(product_category_name,IsLiveProductCategory,added_by_fk,modified_by_fk)
      values(@product_category_name,@IsLiveProductCategory,@user_Id,@user_Id)
    end
end

create procedure update_a_product_category
(
   @product_category_Id int,
   @product_category_name varchar(250),
   @IsLiveProductCategory bit,
   @user_Id uniqueidentifier
)
as
begin
  
      update product_category_master
      set product_category_name=@product_category_name,
      IsLiveProductCategory=@IsLiveProductCategory,
      modified_by_fk=@user_Id,
      date_modified=GETDATE()
      where product_category_Id=@product_category_Id
    
end


create procedure delete_a_product_category
(
  @product_category_Id int
)
as
begin
  delete from product_category_master where product_category_Id=@product_category_Id
end

create procedure get_a_product_category
(
  @product_category_Id int
)
as
begin
  select * from product_category_master where product_category_Id=@product_category_Id
end


create procedure get_all_product_categories
as
begin
  select * from product_category_master order by date_added desc
end

create procedure get_all_live_product_categories

as
begin
  select * from product_category_master where IsLiveProductCategory='true' order by date_added desc
end


/*product_master*/
create table product_master
(
   product_Id int identity(1,1) primary key,
   product_name varchar(250) not null unique,
   product_scientific_name varchar(250),
   product_description varchar(2000),
   product_photo image,
   product_keywords varchar(250),
   product_intake varchar(250),
   product_category_Id int references product_category_master(product_category_Id) on delete cascade on update cascade,
   IsLiveProduct bit,
   IsInStock bit,
   date_added datetime default getdate(),
   added_by_fk uniqueidentifier,
   date_modified datetime default getdate(),
   modified_by_fk uniqueidentifier
)

create procedure add_a_product
(
   @product_name varchar(250),
   @product_scientific_name varchar(250),
   @product_description varchar(2000),
   @product_photo image,
   @product_keywords varchar(250),
   @product_intake varchar(250),
   @product_category_Id int,
   @IsLiveProduct bit,
   @IsInStock bit,
   @user_Id uniqueidentifier
)
as
begin
   if not exists(select * from product_master where product_name=@product_name)
     begin
        insert into product_master(product_name,product_scientific_name,product_description,product_photo,product_keywords,product_intake,product_category_Id,IsLiveProduct,IsInStock,added_by_fk,modified_by_fk)
        values(@product_name,@product_scientific_name,@product_description,@product_photo,@product_keywords,@product_intake,@product_category_Id,@IsLiveProduct,@IsInStock,@user_Id,@user_Id)
     end
end


create procedure update_a_product
(
   @product_Id int,
   @product_name varchar(250),
   @product_scientific_name varchar(250),
   @product_description varchar(2000),
   @product_keywords varchar(250),
   @product_intake varchar(250),
   @product_category_Id int,
   @IsLiveProduct bit,
   @IsInStock bit,
   @user_Id uniqueidentifier
)
as
begin
  
        update product_master
        set product_name=@product_name,
        product_scientific_name=@product_scientific_name,
        product_description=@product_description,
        product_keywords=@product_keywords,
        product_intake=@product_intake,
        product_category_Id=@product_category_Id,
        IsLiveProduct=@IsLiveProduct,
        IsInStock=@IsInStock,
        modified_by_fk=@user_Id,
        date_modified=GETDATE()
        where product_Id=@product_Id
     
end


create procedure update_a_product_photo
(
  @product_Id int,
  @product_photo image,
  @user_Id uniqueidentifier
)
as
begin

 update product_master
 set product_photo=@product_photo,
 modified_by_fk=@user_Id,
 date_modified=GETDATE()
 where product_Id=@product_Id
 
end

create procedure delete_a_product
(
  @product_Id int
)
as
begin
   delete from product_master where product_Id=@product_Id
end

create procedure get_a_product
(
  @product_Id int
)
as
begin
   select * from product_master where product_Id=@product_Id
end


create procedure get_all_products

as
begin
   select * from product_master order by date_added desc
end

create procedure get_all_live_products

as
begin
   select * from product_master where IsLiveProduct='true' order by date_added desc
end

create procedure get_all_products_of_category(@product_category_Id int)

as
begin
   select * from product_master where product_category_Id=@product_category_Id order by date_added desc
end

create procedure get_all_live_products_of_category(@product_category_Id int)

as
begin
   select * from product_master where product_category_Id=@product_category_Id and IsLiveProduct='true' order by date_added desc
end

create procedure get_a_product_photo(@product_Id int)
as
begin
   select product_photo from product_master where product_Id=@product_Id
end

/*product_unit_master*/
create table product_unit_master
(
 product_Id int references product_master(product_Id) on delete cascade on update cascade,
 product_unit varchar(250),
 primary key(product_Id,product_unit),
 product_unit_rate numeric(9,2),
 date_added datetime default getdate(),
 added_by_fk uniqueidentifier,
 date_modified datetime default getdate(),
 modified_by_fk uniqueidentifier
)


create procedure add_a_product_unit
(
  @product_Id int,
  @product_unit varchar(250),
  @product_unit_rate numeric(9,2),
  @user_Id uniqueidentifier
)
as
begin
  if not exists(select * from product_unit_master where product_Id=@product_Id and product_unit=@product_unit)
    begin
       insert into product_unit_master(product_Id,product_unit,product_unit_rate,added_by_fk,modified_by_fk)
       values(@product_Id,@product_unit,@product_unit_rate,@user_Id,@user_Id)
    end
end

create procedure update_a_product_unit_rate
(
  @product_Id int,
  @product_unit varchar(250),
  @product_unit_rate numeric(9,2),
  @user_Id uniqueidentifier
)
as
begin
 
       update product_unit_master
       set product_unit_rate=@product_unit_rate,
       modified_by_fk=@user_Id,
       date_modified=GETDATE()
       where product_Id=@product_Id and product_unit=@product_unit
    
end

create procedure delete_a_product_unit
(
  @product_Id int,
  @product_unit varchar(250)
)
as
begin
  delete from product_unit_master where product_Id=@product_Id and product_unit=@product_unit
end

create procedure get_all_units_of_a_product
(
  @product_Id int
 
)
as
begin
  select * from product_unit_master where product_Id=@product_Id 
end