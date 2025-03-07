PGDMP  9                    |            postgres    16.2    16.2 L    @           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            A           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            B           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            C           1262    5    postgres    DATABASE     �   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Philippines.1252';
    DROP DATABASE postgres;
                postgres    false            D           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    4931                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            E           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            �            1259    16398    faculty_attendance    TABLE     $  CREATE TABLE public.faculty_attendance (
    id integer NOT NULL,
    "time" text,
    date text,
    fullname character varying(255),
    year integer,
    section character varying(50),
    student_number character varying(50),
    faculty_id integer,
    subject character varying(255)
);
 &   DROP TABLE public.faculty_attendance;
       public         heap    postgres    false            �            1259    16403    attendance_id_seq    SEQUENCE     �   CREATE SEQUENCE public.attendance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.attendance_id_seq;
       public          postgres    false    216            F           0    0    attendance_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.attendance_id_seq OWNED BY public.faculty_attendance.id;
          public          postgres    false    217            �            1259    16404    faculty    TABLE     V  CREATE TABLE public.faculty (
    faculty_id integer NOT NULL,
    user_id integer NOT NULL,
    first_name character varying(100),
    last_name character varying(100),
    recovery_email character varying(255),
    address character varying(255),
    age integer,
    gender character varying(10),
    reset_token character varying(255)
);
    DROP TABLE public.faculty;
       public         heap    postgres    false            �            1259    16409    faculty_faculty_id_seq    SEQUENCE     �   CREATE SEQUENCE public.faculty_faculty_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.faculty_faculty_id_seq;
       public          postgres    false    218            G           0    0    faculty_faculty_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.faculty_faculty_id_seq OWNED BY public.faculty.faculty_id;
          public          postgres    false    219            �            1259    16410    parent    TABLE     P  CREATE TABLE public.parent (
    parent_id integer NOT NULL,
    user_id integer,
    first_name character varying(255),
    last_name character varying(255),
    recovery_email character varying(255),
    address text,
    age integer,
    gender character varying(6),
    student_id integer,
    reset_token character varying(255)
);
    DROP TABLE public.parent;
       public         heap    postgres    false            �            1259    16415    parent_parent_id_seq    SEQUENCE     �   CREATE SEQUENCE public.parent_parent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.parent_parent_id_seq;
       public          postgres    false    220            H           0    0    parent_parent_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.parent_parent_id_seq OWNED BY public.parent.parent_id;
          public          postgres    false    221            �            1259    16416    rfid    TABLE     :   CREATE TABLE public.rfid (
    rfid_code text NOT NULL
);
    DROP TABLE public.rfid;
       public         heap    postgres    false            �            1259    16421    student    TABLE     {  CREATE TABLE public.student (
    student_id integer NOT NULL,
    user_id integer,
    first_name character varying(255),
    last_name character varying(255),
    student_number character varying(20),
    recovery_email character varying(255),
    address text,
    age integer,
    gender character varying(6),
    parent_id integer,
    reset_token character varying(255)
);
    DROP TABLE public.student;
       public         heap    postgres    false            �            1259    24607    student_attendance    TABLE       CREATE TABLE public.student_attendance (
    id integer NOT NULL,
    "time" text,
    date date,
    fullname character varying(100),
    year integer,
    section character varying(10),
    student_number character varying(20),
    subject character varying(100)
);
 &   DROP TABLE public.student_attendance;
       public         heap    postgres    false            �            1259    24606    student_attendance_id_seq    SEQUENCE     �   CREATE SEQUENCE public.student_attendance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.student_attendance_id_seq;
       public          postgres    false    232            I           0    0    student_attendance_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.student_attendance_id_seq OWNED BY public.student_attendance.id;
          public          postgres    false    231            �            1259    16426    student_list    TABLE     q  CREATE TABLE public.student_list (
    id integer NOT NULL,
    faculty_id integer,
    rfid_code character varying(255),
    student_number character varying(255),
    student_name character varying(100),
    year integer,
    section character varying(10),
    gender character varying(10),
    image text,
    subject character varying(255),
    absences integer
);
     DROP TABLE public.student_list;
       public         heap    postgres    false            �            1259    16431     student_list_student_list_id_seq    SEQUENCE     �   CREATE SEQUENCE public.student_list_student_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.student_list_student_list_id_seq;
       public          postgres    false    224            J           0    0     student_list_student_list_id_seq    SEQUENCE OWNED BY     X   ALTER SEQUENCE public.student_list_student_list_id_seq OWNED BY public.student_list.id;
          public          postgres    false    225            �            1259    16432    student_student_id_seq    SEQUENCE     �   CREATE SEQUENCE public.student_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.student_student_id_seq;
       public          postgres    false    223            K           0    0    student_student_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.student_student_id_seq OWNED BY public.student.student_id;
          public          postgres    false    226            �            1259    24584    subject    TABLE     +  CREATE TABLE public.subject (
    id integer NOT NULL,
    faculty_id integer,
    rfid_code character varying(50),
    subject_name character varying(100),
    section character varying(50),
    time_start character varying(50),
    time_end character varying(50),
    day character varying(50)
);
    DROP TABLE public.subject;
       public         heap    postgres    false            �            1259    24583    subject_id_seq    SEQUENCE     �   CREATE SEQUENCE public.subject_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.subject_id_seq;
       public          postgres    false    230            L           0    0    subject_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.subject_id_seq OWNED BY public.subject.id;
          public          postgres    false    229            �            1259    16433    users    TABLE     �   CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    usertype character varying(50) NOT NULL,
    reset_token character varying(255)
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16438    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    227            M           0    0    users_id_seq    SEQUENCE OWNED BY     B   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.user_id;
          public          postgres    false    228            y           2604    24626    faculty faculty_id    DEFAULT     x   ALTER TABLE ONLY public.faculty ALTER COLUMN faculty_id SET DEFAULT nextval('public.faculty_faculty_id_seq'::regclass);
 A   ALTER TABLE public.faculty ALTER COLUMN faculty_id DROP DEFAULT;
       public          postgres    false    219    218            x           2604    24627    faculty_attendance id    DEFAULT     v   ALTER TABLE ONLY public.faculty_attendance ALTER COLUMN id SET DEFAULT nextval('public.attendance_id_seq'::regclass);
 D   ALTER TABLE public.faculty_attendance ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216            z           2604    24628    parent parent_id    DEFAULT     t   ALTER TABLE ONLY public.parent ALTER COLUMN parent_id SET DEFAULT nextval('public.parent_parent_id_seq'::regclass);
 ?   ALTER TABLE public.parent ALTER COLUMN parent_id DROP DEFAULT;
       public          postgres    false    221    220            {           2604    24629    student student_id    DEFAULT     x   ALTER TABLE ONLY public.student ALTER COLUMN student_id SET DEFAULT nextval('public.student_student_id_seq'::regclass);
 A   ALTER TABLE public.student ALTER COLUMN student_id DROP DEFAULT;
       public          postgres    false    226    223                       2604    24630    student_attendance id    DEFAULT     ~   ALTER TABLE ONLY public.student_attendance ALTER COLUMN id SET DEFAULT nextval('public.student_attendance_id_seq'::regclass);
 D   ALTER TABLE public.student_attendance ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    231    232            |           2604    24631    student_list id    DEFAULT        ALTER TABLE ONLY public.student_list ALTER COLUMN id SET DEFAULT nextval('public.student_list_student_list_id_seq'::regclass);
 >   ALTER TABLE public.student_list ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224            ~           2604    24632 
   subject id    DEFAULT     h   ALTER TABLE ONLY public.subject ALTER COLUMN id SET DEFAULT nextval('public.subject_id_seq'::regclass);
 9   ALTER TABLE public.subject ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    230    230            }           2604    24633    users user_id    DEFAULT     i   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    228    227            /          0    16404    faculty 
   TABLE DATA           �   COPY public.faculty (faculty_id, user_id, first_name, last_name, recovery_email, address, age, gender, reset_token) FROM stdin;
    public          postgres    false    218   S[       -          0    16398    faculty_attendance 
   TABLE DATA           |   COPY public.faculty_attendance (id, "time", date, fullname, year, section, student_number, faculty_id, subject) FROM stdin;
    public          postgres    false    216   �[       1          0    16410    parent 
   TABLE DATA           �   COPY public.parent (parent_id, user_id, first_name, last_name, recovery_email, address, age, gender, student_id, reset_token) FROM stdin;
    public          postgres    false    220   0\       3          0    16416    rfid 
   TABLE DATA           )   COPY public.rfid (rfid_code) FROM stdin;
    public          postgres    false    222   �\       4          0    16421    student 
   TABLE DATA           �   COPY public.student (student_id, user_id, first_name, last_name, student_number, recovery_email, address, age, gender, parent_id, reset_token) FROM stdin;
    public          postgres    false    223   �\       =          0    24607    student_attendance 
   TABLE DATA           p   COPY public.student_attendance (id, "time", date, fullname, year, section, student_number, subject) FROM stdin;
    public          postgres    false    232   �\       5          0    16426    student_list 
   TABLE DATA           �   COPY public.student_list (id, faculty_id, rfid_code, student_number, student_name, year, section, gender, image, subject, absences) FROM stdin;
    public          postgres    false    224   E]       ;          0    24584    subject 
   TABLE DATA           n   COPY public.subject (id, faculty_id, rfid_code, subject_name, section, time_start, time_end, day) FROM stdin;
    public          postgres    false    230   2a       8          0    16433    users 
   TABLE DATA           S   COPY public.users (user_id, username, password, usertype, reset_token) FROM stdin;
    public          postgres    false    227   �a       N           0    0    attendance_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.attendance_id_seq', 7, true);
          public          postgres    false    217            O           0    0    faculty_faculty_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.faculty_faculty_id_seq', 3, true);
          public          postgres    false    219            P           0    0    parent_parent_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.parent_parent_id_seq', 1, true);
          public          postgres    false    221            Q           0    0    student_attendance_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.student_attendance_id_seq', 7, true);
          public          postgres    false    231            R           0    0     student_list_student_list_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.student_list_student_list_id_seq', 98, true);
          public          postgres    false    225            S           0    0    student_student_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.student_student_id_seq', 1, false);
          public          postgres    false    226            T           0    0    subject_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.subject_id_seq', 48, true);
          public          postgres    false    229            U           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 4, true);
          public          postgres    false    228            �           2606    16446 "   faculty_attendance attendance_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.faculty_attendance
    ADD CONSTRAINT attendance_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.faculty_attendance DROP CONSTRAINT attendance_pkey;
       public            postgres    false    216            �           2606    16448    faculty faculty_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.faculty
    ADD CONSTRAINT faculty_pkey PRIMARY KEY (faculty_id);
 >   ALTER TABLE ONLY public.faculty DROP CONSTRAINT faculty_pkey;
       public            postgres    false    218            �           2606    16450    faculty faculty_user_id_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.faculty
    ADD CONSTRAINT faculty_user_id_key UNIQUE (user_id);
 E   ALTER TABLE ONLY public.faculty DROP CONSTRAINT faculty_user_id_key;
       public            postgres    false    218            �           2606    16452    parent parent_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.parent
    ADD CONSTRAINT parent_pkey PRIMARY KEY (parent_id);
 <   ALTER TABLE ONLY public.parent DROP CONSTRAINT parent_pkey;
       public            postgres    false    220            �           2606    16454    rfid rfid_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.rfid
    ADD CONSTRAINT rfid_pkey PRIMARY KEY (rfid_code);
 8   ALTER TABLE ONLY public.rfid DROP CONSTRAINT rfid_pkey;
       public            postgres    false    222            �           2606    24614 *   student_attendance student_attendance_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.student_attendance
    ADD CONSTRAINT student_attendance_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.student_attendance DROP CONSTRAINT student_attendance_pkey;
       public            postgres    false    232            �           2606    16456    student_list student_list_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.student_list
    ADD CONSTRAINT student_list_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.student_list DROP CONSTRAINT student_list_pkey;
       public            postgres    false    224            �           2606    16458    student student_number 
   CONSTRAINT     [   ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_number UNIQUE (student_number);
 @   ALTER TABLE ONLY public.student DROP CONSTRAINT student_number;
       public            postgres    false    223            �           2606    16460    student student_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (student_id);
 >   ALTER TABLE ONLY public.student DROP CONSTRAINT student_pkey;
       public            postgres    false    223            �           2606    24589    subject subject_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.subject
    ADD CONSTRAINT subject_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.subject DROP CONSTRAINT subject_pkey;
       public            postgres    false    230            �           2606    16462    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    227            �           2606    24595    subject faculty_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.subject
    ADD CONSTRAINT faculty_id_fkey FOREIGN KEY (faculty_id) REFERENCES public.faculty(faculty_id);
 A   ALTER TABLE ONLY public.subject DROP CONSTRAINT faculty_id_fkey;
       public          postgres    false    230    218    4739            �           2606    16468    faculty faculty_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.faculty
    ADD CONSTRAINT faculty_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 F   ALTER TABLE ONLY public.faculty DROP CONSTRAINT faculty_user_id_fkey;
       public          postgres    false    227    4753    218            �           2606    16473     faculty_attendance fk_faculty_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.faculty_attendance
    ADD CONSTRAINT fk_faculty_id FOREIGN KEY (faculty_id) REFERENCES public.faculty(faculty_id);
 J   ALTER TABLE ONLY public.faculty_attendance DROP CONSTRAINT fk_faculty_id;
       public          postgres    false    218    216    4739            �           2606    16478    student_list fk_faculty_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.student_list
    ADD CONSTRAINT fk_faculty_id FOREIGN KEY (faculty_id) REFERENCES public.faculty(faculty_id);
 D   ALTER TABLE ONLY public.student_list DROP CONSTRAINT fk_faculty_id;
       public          postgres    false    4739    218    224            �           2606    16483    parent fk_student_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.parent
    ADD CONSTRAINT fk_student_id FOREIGN KEY (student_id) REFERENCES public.student(student_id) ON DELETE CASCADE;
 >   ALTER TABLE ONLY public.parent DROP CONSTRAINT fk_student_id;
       public          postgres    false    4749    223    220            �           2606    16488    parent parent_user_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.parent
    ADD CONSTRAINT parent_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 D   ALTER TABLE ONLY public.parent DROP CONSTRAINT parent_user_id_fkey;
       public          postgres    false    4753    227    220            �           2606    16493    student student_parent_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.parent(parent_id);
 H   ALTER TABLE ONLY public.student DROP CONSTRAINT student_parent_id_fkey;
       public          postgres    false    220    223    4743            �           2606    16498    student student_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 F   ALTER TABLE ONLY public.student DROP CONSTRAINT student_user_id_fkey;
       public          postgres    false    4753    227    223            /   x   x�U�=�0��9EOP)�`������HH^��pz�K���W�|�K��{<��R؃�����hLg�X#��qp��
�'sQ��$�]R�цmB#F+T��I�)Ky��o_�1_�7k      -   E   x�3�44�21�25Sp��)MU�M,R04R0202������4�t�42�50�05rR��s2�3�b���� �F6      1   I   x���� ��^1$�+�9@���D'��̐��t���M�2���g�����U;��Z�� �IAD>$      3      x������ � �      4      x������ � �      =   r   x���1�0F��9E/d��S�pV�h;��R!baA^��IOH`I�_�a$0r�E�]�/	{��^��ϲ��Ј�MR#�n����?�����I9I�ܐg#��O�.��E�P      5   �  x����n�H��������?�m�06f�*��P�t�#��m�����G�gȋm9�j������U]眲�����3\8��{�%�:��t٫�����Mi��j��O�o����g���1�r�=��ٝ,�r�
�O'�=9�i�����B�J��g�VAܙ�;���X��Z���r��闪-�&�&��5(Y����S�z^`{��0�04���*d� bͼ����h��>�>�9e�q�9�ג�z?�&�a���xx?)�Jyn�|�9o9��ğg���l�@芭�t�U]q��UBj��	�!,_b�KP5݂R��)�e]����O�x8������@�Ҹ��fuE�T{T��$b+������d��r�-�4#�fy|��^���C��Zm�;&:��E��f�����^��M��y���t˅�i.[��r�S鏐�c"�1�v���K��I�Uw����`D��D1;b�[Y
�;J����_7}��\�6V�g_N�	�{A(���x0���zd�.Lާ}#цk)^р�������Ր)+x��/��?k�&��]�,�|�����i�^+}c�D�.Y�?��!{��xSR\�a�D�!Ye�&f,��ԉ��`�[]g���e�f���JhӼ��ai[����9=�C�C�UKc����'S�Ir��͐�%��Ē�����\1"���~1��c�IR���w��gTk�/�;��k$�v�A�{�q��ixKY���'��Iz��w�u�{�=�I����#O���@{R�9����C�[��*0w����Bk�;�A��q�`����^���%�?3�	��,��C�78�CI#�^���Z��Ʉ�K�,�)vH�Z��a�m�?w�!9���BZ%�k��Gx�u�����1Kq�f�Wu��7�Z�_�?�K���d����%C�R�I^�\i��p�jl; q��*�.E|����v�}���f� s|��      ;   x   x�3�4�40426�L�HM-N�O�t�� .sNCN#c#ss΂�����������<�JC+S3� _0��)��X����QZbr�X���_������ehhe`�C{� ��*�      8      x�M�Ir�@ @�5��uG�&�R$�A��0F�1�OLU,/�����.b��Saq"|�e�� I7X���-�Q,��أYri+q������5���_��9*��?W�r,�Y4���x��' c���lJⷡQfC�T����{���>=��r2OQ��c�fb��N*�#�|̼������L��9C�������g�����N(�������4]�5e���Nٙ��$�޾�{G��I���] M�?m�c     