create database ecomm_db

\c ecomm_db

create table item_status(
id serial primary key,
item_status varchar(20) not null check(
    item_status in (
    'delivered','notdelivered','in_stock','exchange_policy_true','exchange_policy_false'
    )
)
)

create table pay_status(
id serial primary key,
pay_status varchar(20) not null check(
    pay_status in (
    'cash','online','both_cash&online','cash_on_delivery'
    )
)
)

create table roles_enquiry_form(
id serial primary key,
role varchar(20) not null check(
    role in (
    'customer','sales','marketing','dealer/supplier'
    )
)
)

create table warranty_status(
id serial primary key,
warranty_status varchar(20) not null check(
    warranty_status in (
    'applicable','not_applicable'
    )
)
)

create table item_exchange_status(
id serial primary key,
exchange_status varchar(20) not null check(
    exchange_status in (
    'applicable','not_applicable'
    )
)
)

--------------------------------------
create table item_size(
id serial primary key,
foot_wear_size varchar(20) not null check(
    foot_wear_size in (
    'xtra_small','small','medium','large',
    'extra_large'
    )
)
)

create table customer_reg(
 cid serial PRIMARY key,
 cname varchar(40) not null,
 cmobile varchar(14) not null,
 created_at Timestamp DEFAULT CURRENT_TIMESTAMP null
)

create table price_listing_inventory(
id serial PRIMARY KEY,
item_id integer REFERENCES item_listing_inventory(id),
price decimal(10,2) null
)

create table item_listing_inventory(
id serial primary key,
item_size integer REFERENCES
    item_size(id),
image_url varchar(255) null,
quantity integer not null
)


create table item_names(
id integer REFERENCES item_listing_inventory(id),
item_name varchar(255) null
)

create table orders(
id serial PRIMARY KEY,
order_date Date default CURRENT_DATE,
item_id integer REFERENCES item_listing_inventory(id),
custormer_id integer REFERENCES customer_reg(cid)
)
------------------------------------------

create table logis_comp_contr_status(
id serial PRIMARY KEY,
contract_status varchar(20) not null check(
    contract_status in (
    'in_contract','lapse','revoked'
    )
    )

);

create table logistic_company(
id serial PRIMARY key,
logistic_company varchar(255) not null,
contract_start Date DEFAULT CURRENT_DATE,
contract_end_Date Date NULL,
status integer REFERENCES logis_comp_contr_status(id)
)

create table delivery_status(
id serial PRIMARY KEY,
delivery_status varchar(20) not null check(
    delivery_status in (
    'dispatched','received','cancelled',
    'undelivered'
    )
    )
)

create table deliveries(
delivery_id serial PRIMARY key,
delivery_date DATE null,

item_id integer REFERENCES item_listing_inventory(id),
delivery_status_id integer REFERENCES
delivery_status(id),
pay_status_id integer REFERENCES pay_status(id)

)
---------------------------------------------

create table customer_purchase(
cid integer REFERENCES customer_reg(cid),
item_id integer REFERENCES item_listing_inventory(id),
pid integer REFERENCES price_listing_inventory(id),
pay_method integer REFERENCES pay_status(id),
warr_or_exc integer REFERENCES warranty_status(id)
)
----------------------------------------------------------

create table admin_team(
admin_id integer PRIMARY key,
admin_type varchar(20) not null check(
    admin_type in ('main-dev','auditor','sub-dev')
),
admin_email varchar(255) not null,
admin_pass varchar(255) not null,
date_created Timestamp DEFAULT CURRENT_TIMESTAMP
)

insert into admin_team(admin_id,admin_type,admin_email,admin_pass) values
(8080,'main-dev','chandan@gmail.com','admin');

---------------------------------

insert into item_status values
(1,'delivered'),
(2,'notdelivered'),
(3,'in_stock')

insert into pay_status values
(1,'cash'),
(2,'online'),
(3,'both_cash&online'),
(4,'cash_on_delivery');


insert into warranty_status values
(1,'applicable'),
(2,'not_applicable')

insert into item_exchange_status values
(1,'applicable'),
(2,'not_applicable')


insert into item_size values
(1,'xtra_small'),
(2,'small'),
(3,'medium'),
(4,'large'),
(5,'extra_large')


insert into logis_comp_contr_status values
(1,'in_contract'),
(2,'lapse'),
(3,'revoked')

delete from delivery_status;

insert into delivery_status values
(1,'dispatched'),
(2,'received'),
(3,'cancelled'),
(4,'undelivered')