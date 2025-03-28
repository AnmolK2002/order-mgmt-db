PGDMP  -            
        }           postgres    17.2    17.0 &               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false                       1262    5    postgres    DATABASE     |   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Canada.1252';
    DROP DATABASE postgres;
                     postgres    false                       0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                        postgres    false    4894                        2615    16434    oms    SCHEMA        CREATE SCHEMA oms;
    DROP SCHEMA oms;
                     postgres    false            �            1259    16436    customer    TABLE     �   CREATE TABLE oms.customer (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    phone_number character varying(20),
    address text
);
    DROP TABLE oms.customer;
       oms         heap r       postgres    false    6            �            1259    16435    customer_id_seq    SEQUENCE     �   CREATE SEQUENCE oms.customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE oms.customer_id_seq;
       oms               postgres    false    219    6                        0    0    customer_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE oms.customer_id_seq OWNED BY oms.customer.id;
          oms               postgres    false    218            �            1259    16536    order_items    TABLE     �   CREATE TABLE oms.order_items (
    id integer NOT NULL,
    order_id bigint NOT NULL,
    product_name character varying(50) NOT NULL,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL
);
    DROP TABLE oms.order_items;
       oms         heap r       postgres    false    6            �            1259    16535    order_items_id_seq    SEQUENCE     �   CREATE SEQUENCE oms.order_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE oms.order_items_id_seq;
       oms               postgres    false    227    6            !           0    0    order_items_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE oms.order_items_id_seq OWNED BY oms.order_items.id;
          oms               postgres    false    226            �            1259    16495    orders    TABLE     [  CREATE TABLE oms.orders (
    id integer NOT NULL,
    order_id character varying(50) NOT NULL,
    customer_name character varying(50) NOT NULL,
    shipping_address text,
    billing_address text,
    payment_method character varying(50),
    status character varying(50),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE oms.orders;
       oms         heap r       postgres    false    6            �            1259    16494    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE oms.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE oms.orders_id_seq;
       oms               postgres    false    6    225            "           0    0    orders_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE oms.orders_id_seq OWNED BY oms.orders.id;
          oms               postgres    false    224            �            1259    16457    products    TABLE     �   CREATE TABLE oms.products (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    price numeric(10,2) NOT NULL,
    description character varying(255),
    CONSTRAINT chk_price_positive CHECK ((price > (0)::numeric))
);
    DROP TABLE oms.products;
       oms         heap r       postgres    false    6            �            1259    16456    products_id_seq    SEQUENCE     u   CREATE SEQUENCE oms.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE oms.products_id_seq;
       oms               postgres    false    221    6            #           0    0    products_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE oms.products_id_seq OWNED BY oms.products.id;
          oms               postgres    false    220            k           2604    16439    customer id    DEFAULT     d   ALTER TABLE ONLY oms.customer ALTER COLUMN id SET DEFAULT nextval('oms.customer_id_seq'::regclass);
 7   ALTER TABLE oms.customer ALTER COLUMN id DROP DEFAULT;
       oms               postgres    false    218    219    219            o           2604    16539    order_items id    DEFAULT     j   ALTER TABLE ONLY oms.order_items ALTER COLUMN id SET DEFAULT nextval('oms.order_items_id_seq'::regclass);
 :   ALTER TABLE oms.order_items ALTER COLUMN id DROP DEFAULT;
       oms               postgres    false    226    227    227            m           2604    16498 	   orders id    DEFAULT     `   ALTER TABLE ONLY oms.orders ALTER COLUMN id SET DEFAULT nextval('oms.orders_id_seq'::regclass);
 5   ALTER TABLE oms.orders ALTER COLUMN id DROP DEFAULT;
       oms               postgres    false    225    224    225            l           2604    16460    products id    DEFAULT     d   ALTER TABLE ONLY oms.products ALTER COLUMN id SET DEFAULT nextval('oms.products_id_seq'::regclass);
 7   ALTER TABLE oms.products ALTER COLUMN id DROP DEFAULT;
       oms               postgres    false    220    221    221                      0    16436    customer 
   TABLE DATA           X   COPY oms.customer (id, first_name, last_name, email, phone_number, address) FROM stdin;
    oms               postgres    false    219   �)                 0    16536    order_items 
   TABLE DATA           O   COPY oms.order_items (id, order_id, product_name, quantity, price) FROM stdin;
    oms               postgres    false    227   D+                 0    16495    orders 
   TABLE DATA           �   COPY oms.orders (id, order_id, customer_name, shipping_address, billing_address, payment_method, status, created_at) FROM stdin;
    oms               postgres    false    225   �+                 0    16457    products 
   TABLE DATA           =   COPY oms.products (id, name, price, description) FROM stdin;
    oms               postgres    false    221   <,       $           0    0    customer_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('oms.customer_id_seq', 10, true);
          oms               postgres    false    218            %           0    0    order_items_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('oms.order_items_id_seq', 3, true);
          oms               postgres    false    226            &           0    0    orders_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('oms.orders_id_seq', 2, true);
          oms               postgres    false    224            '           0    0    products_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('oms.products_id_seq', 12, true);
          oms               postgres    false    220            r           2606    16445    customer customer_email_key 
   CONSTRAINT     T   ALTER TABLE ONLY oms.customer
    ADD CONSTRAINT customer_email_key UNIQUE (email);
 B   ALTER TABLE ONLY oms.customer DROP CONSTRAINT customer_email_key;
       oms                 postgres    false    219            t           2606    16443    customer customer_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY oms.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);
 =   ALTER TABLE ONLY oms.customer DROP CONSTRAINT customer_pkey;
       oms                 postgres    false    219            ~           2606    16541    order_items order_items_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY oms.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY oms.order_items DROP CONSTRAINT order_items_pkey;
       oms                 postgres    false    227            z           2606    16505    orders orders_order_id_key 
   CONSTRAINT     V   ALTER TABLE ONLY oms.orders
    ADD CONSTRAINT orders_order_id_key UNIQUE (order_id);
 A   ALTER TABLE ONLY oms.orders DROP CONSTRAINT orders_order_id_key;
       oms                 postgres    false    225            |           2606    16503    orders orders_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY oms.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 9   ALTER TABLE ONLY oms.orders DROP CONSTRAINT orders_pkey;
       oms                 postgres    false    225            v           2606    16463    products products_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY oms.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 =   ALTER TABLE ONLY oms.products DROP CONSTRAINT products_pkey;
       oms                 postgres    false    221            x           2606    16465    products uq_product_name 
   CONSTRAINT     P   ALTER TABLE ONLY oms.products
    ADD CONSTRAINT uq_product_name UNIQUE (name);
 ?   ALTER TABLE ONLY oms.products DROP CONSTRAINT uq_product_name;
       oms                 postgres    false    221                       2606    16542 %   order_items order_items_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY oms.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES oms.orders(id) ON DELETE CASCADE;
 L   ALTER TABLE ONLY oms.order_items DROP CONSTRAINT order_items_order_id_fkey;
       oms               postgres    false    4732    227    225               �  x�u��n�0E�㯘��A=v�堭a�E�ȦVb,:eP�S��;����0�.�Lۡ���h`����?�?Ś�!D'i��� ���x��R��N��V�}��U[iz=up���~�UYD��R +��o�xQvV�0��^��q,(O�t�@�&�W�P���V�2�����2�vû��F췧�JA��C�c�K���/w����6�B��Ϭ�sऀ����Z����A��2��G�H�*]�%�nȎ�,M"j@@�S�U+ݧ�*��-쥛���ࣶ����� ��2��4v�>�[	�d�C��q&�虹�e�o7&���S�]qm.w*�(�%�o�Yi�%�`��Cx�J����8��ŚZ7w�Ӣwrv^��'g<����(ʨ�q/���m�avw���V��?K         B   x�3�4�,(�O)M.�53��4�4�4�Գ��2B�15162��2�@50C#cSNcN�D� ,w         �   x�3��/JI-�542�L.-.��q8�\���<��Ǽʒ��<��`G<2�E�)�%�ɉE)��~.�~�FF��F�f
��V&�V&�zFƖf��\FP�ML�6q�
�9�`��K2R���*H�,H����pu�gm� �C�         �   x���1�0����=�e;q������PT��,�[��O���t޷�gy+�pkt���}}���1m��w��H�@R�D��ғ	9d&$3<��:K7�C�T�x�(�q�&j�J.��-d#5���*��BiTU�걨��Tqa _����     