use AdventureWorksDW2019;

-- 1
with tr as(
select sum(f.TotalProductCost) as suma, f.OrderDate from FactInternetSales f group by f.OrderDate
)
select suma, OrderDate, avg(suma) over (order by OrderDate rows between 3 preceding and current row) as SredniaKroczaca from tr;

-- 2
select month_of_year, isnull([0],0) as [0], [1] as [1],isnull([2],0) as [2], isnull([3],0) as [3], [4], isnull([5],0) as [5], [6], [7], [8], [9], [10]
from  
(
  select month(OrderDate) as month_of_year, SalesTerritoryKey, sum(SalesAmount) as suma
  from FactInternetSales
  where year(OrderDate) = 2011
  group by month(OrderDate), SalesTerritoryKey
) r 
pivot  
(  
  sum(suma)
  for SalesTerritoryKey IN ([0],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10]) 
) as pvt;

-- 3
select f.OrganizationKey, f.DepartmentGroupKey, sum(f.Amount) as amt from FactFinance f
group by rollup(f.OrganizationKey, f.DepartmentGroupKey)
order by f.OrganizationKey;

-- 4
select f.OrganizationKey, f.DepartmentGroupKey, sum(f.Amount) as amt from FactFinance f
group by cube(f.OrganizationKey, f.DepartmentGroupKey)
order by f.OrganizationKey;

-- 5
with tr as(
select f.OrganizationKey, d.OrganizationName, sum(f.Amount) as amt from FactFinance f 
join DimOrganization d on f.OrganizationKey = d.OrganizationKey 
where year(date) = 2012
group by f.OrganizationKey, d.OrganizationName
)
select *, percent_rank() over (order by amt) as percentile from tr t
order by OrganizationKey;

-- 6
with tr as(
select f.OrganizationKey, d.OrganizationName, sum(f.Amount) as amt from FactFinance f 
join DimOrganization d on f.OrganizationKey = d.OrganizationKey 
where year(date) = 2012
group by f.OrganizationKey, d.OrganizationName
)
select *, percent_rank() over (order by amt) as percentile, STDEV(amt) over (order by amt) as std from tr t
order by OrganizationKey;