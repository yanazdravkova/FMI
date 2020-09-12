USE movies;

-- �������� ������, ����� ������� ������� �� ���������, ����� �� ���� �
-- ���������� � ����� �������� ��-������ �� 10 �������.

  (SELECT NAME
   FROM MOVIESTAR
   WHERE GENDER = 'F') INTERSECT
  (SELECT NAME
   FROM MOVIEEXEC
   WHERE NETWORTH > 10000000)-- �������� ������, ����� ������� ������� �� ���� ������� (���� � ����), �����
-- �� �� ����������.

SELECT NAME
FROM MOVIESTAR
WHERE NAME NOT IN
    (SELECT NAME
     FROM MOVIEEXEC)-- �������� ������, ����� ������� ������� �� ������������ � ������� ��
-- ����������� �� ����� ���������� �� � ��-������ �� ����������� �� ����������
-- �Merv Griffin�

  SELECT *
  FROM MOVIEEXEC -- join MOVIE on MOVIEEXEC.CERT# = MOVIE.PRODUCERC#
WHERE NETWORTH > ALL
    (SELECT NETWORTH
     FROM MOVIEEXEC
     WHERE NAME = 'Merv Griffin') USE pc;

--�������� ������, ����� ������� ��������������� �� ���������� �������� �
--������� ���� 500.

SELECT DISTINCT maker
FROM product
WHERE Model IN
    (SELECT model
     FROM pc
     WHERE speed >= 500)--�������� ������, ����� ������� ���������� � ���-������ ����.

  SELECT *
  FROM printer WHERE price >= ALL
    (SELECT price
     FROM printer)--�������� ������, ����� ������� ���������, ����� ������� � ��-����� ��
--��������� �� ����� � �� � ���������� ��������.

  SELECT *
  FROM laptop WHERE laptop.speed < ALL
    (SELECT speed
     FROM pc)--�������� ������, ����� ������� ������ �� �������� (PC, ��� ��� ��� �������) �
--���-������ ����.

  SELECT DISTINCT model
  FROM
    (SELECT model,
            price
     FROM laptop
     UNION ALL SELECT model,
                      price
     FROM pc
     UNION ALL SELECT model,
                      price
     FROM printer) AllProducts WHERE price >= ALL
    (SELECT price
     FROM pc
     UNION ALL SELECT price
     FROM laptop
     UNION ALL SELECT price
     FROM printer);

-- �������� ������, ����� ������� ������������� �� ������� ������� � ���-����� ����.

SELECT DISTINCT maker
FROM product
WHERE model IN
    (SELECT model
     FROM printer
     WHERE color='y'
       AND price <= ALL
         (SELECT price
          FROM printer
          WHERE color='y'))-- �������� ������, ����� ������� ��������������� �� ���� ���������� ��������
-- � ���-����� RAM �����, ����� ���� ���-����� ���������.

  SELECT maker
  FROM product WHERE model IN
    (SELECT model
     FROM pc
     WHERE ram <= ALL
         (SELECT ram
          FROM pc) )
  AND model IN
    (SELECT model
     FROM pc
     WHERE speed >= ALL
         (SELECT speed
          FROM pc
          WHERE ram <= ALL
              (SELECT ram
               FROM pc))) USE ships;

-- �������� ������, ����� ������� ��������, ����� ������ �� � ���-����� ���� ������.

SELECT DISTINCT country
FROM classes
WHERE NUMGUNS >= ALL
    (SELECT NUMGUNS
     FROM classes)--�������� ������, ����� ������� ���������, �� ����� ���� ���� �� �������� �� �
--������� � �����.

  SELECT *
  FROM ships WHERE name IN
    (SELECT name
     FROM outcomes
     WHERE RESULT = 'sunk')-- �������� ������, ����� ������� ������� �� �������� � 16 ������ ������ (bore).

  SELECT name
  FROM ships WHERE CLASS IN
    (SELECT CLASS
     FROM classes
     WHERE bore = 16)-- �������� ������, ����� ������� ������� �� �������, � ����� �� ���������
-- ������ �� ���� �Kongo�.

  SELECT name
  FROM battles -- ��-����� ������� - ���� �������� �� outcomes ��� �� �������� ���� battles
WHERE name IN
    (SELECT name
     FROM battles
     JOIN outcomes ON battles.NAME = OUTCOMES.battle
     AND ship IN
       (SELECT name
        FROM ships
        WHERE CLASS = 'Kongo'))-- �������� ������, ����� ������� ������� �� ��������,
-- ����� ���� ������ � �������� � ��������� � �������� ��� ����� ������� ������ (bore).

  SELECT name
  FROM ships s1
  JOIN classes c1 ON s1.CLASS = c1.CLASS WHERE NUMGUNS >= ALL
    (SELECT NUMGUNS
     FROM classes c2
     WHERE c1.BORE = c2.BORE)