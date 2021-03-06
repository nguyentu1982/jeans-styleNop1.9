
---Câu lệnh dùng để xóa filter theo size và cập nhật mới dựa theo ProductVariantAtribteCombination--------
create proc ProductSpecificationFilterSize
as
begin
SET NOCOUNT ON;
--Delete all Specification
delete from dbo.Nop_Product_SpecificationAttribute_Mapping where SpecificationAttributeOptionID in 
(select SAO.SpecificationAttributeOptionID 
				from dbo.Nop_SpecificationAttributeOption SAO
					inner join dbo.Nop_SpecificationAttribute SA
					on SAO.SpecificationAttributeID = SA.SpecificationAttributeID
					and (SA.Name = N'Size hiện có'
					or SA.Name = N'Size'))
--select * from Nop_Product_SpecificationAttribute_Mapping

declare @productID int, @size nvarchar(10)
declare @SpecificationAttributeOptionID int

DECLARE attribute_cursor CURSOR for 
select ProductID from dbo.Nop_Product

OPEN attribute_cursor
FETCH NEXT FROM attribute_cursor
into @productId

WHILE @@FETCH_STATUS = 0
BEGIN
		IF EXISTS
		(
		SELECT *
		FROM tempdb.dbo.sysobjects
		WHERE ID = OBJECT_ID(N'tempdb..#Temp')
		)
		BEGIN
		DROP TABLE #Temp
		END
		
		SELECT 
			PV.ProductID,
			PV.ProductVariantID,
			AttributesXML.value('(/Attributes//ProductVariantAttribute/@ID)[1]', 'int') as ProductVariantAttributeID,
			AttributesXML.value('(/Attributes//ProductVariantAttribute/node())[1]', 'int') as ProductVariantAttributeValueID
			into #Temp
			FROM Nop_ProductVariantAttributeCombination PVAC
			inner join dbo.Nop_ProductVariant PV
			on PVAC.ProductVariantID = PV.ProductVariantId
			where PVAC.StockQuantity >0
			
		declare product_attribute_cursor CURSOR
		FOR
			select PVAV.Name  from #Temp T
			inner join dbo.Nop_ProductVariantAttributeValue PVAV
			on PVAV.ProductVariantAttributeValueID = T.ProductVariantAttributeValueID
			inner join dbo.Nop_ProductAttribute PA
			on PA.Name = 'Size'
			where T.ProductId = @productId
		
		open product_attribute_cursor
		FETCH NEXT from product_attribute_cursor
		into @size
		while @@FETCH_STATUS = 0
		BEGIN
			set @SpecificationAttributeOptionID = (select SAO.SpecificationAttributeOptionID 
				from dbo.Nop_SpecificationAttributeOption SAO
					inner join dbo.Nop_SpecificationAttribute SA
					on SAO.SpecificationAttributeID = SA.SpecificationAttributeID
					and (SA.Name = N'Size hiện có'
					or SA.Name = N'Size')
					and SAO.Name = @size)
					
			--print @SpecificationAttributeOptionID
			--print @size
			--if not exists 
			--(
			--	select PSAM.ProductID, SA.Name as SpecificationName, SAO.Name from dbo.Nop_Product_SpecificationAttribute_Mapping PSAM
			--	inner join dbo.Nop_SpecificationAttributeOption SAO
			--	on PSAM.SpecificationAttributeOptionID = SAO.SpecificationAttributeOptionID
			--	inner join dbo.Nop_SpecificationAttribute SA
			--	on SA.SpecificationAttributeID = SAO.SpecificationAttributeID
			--	where SA.Name = N'Size hiện có'
			--	or SA.Name = N'Size'
			--	and PSAM.ProductID = @productID
			--)
			--BEGIN
			set @SpecificationAttributeOptionID = (select SAO.SpecificationAttributeOptionID 
			from dbo.Nop_SpecificationAttributeOption SAO
				inner join dbo.Nop_SpecificationAttribute SA
				on SAO.SpecificationAttributeID = SA.SpecificationAttributeID
				and (SA.Name = N'Size hiện có'
				or SA.Name = N'Size')
				and SAO.Name = @size)
			--		print @SpecificationAttributeOptionID
			insert into dbo.Nop_Product_SpecificationAttribute_Mapping
			values
			(
				@productID, @SpecificationAttributeOptionID, 1, 0,0
			)
			--END
			FETCH NEXT from product_attribute_cursor
			into @size
		END	
		FETCH NEXT FROM attribute_cursor
		into @productId
close product_attribute_cursor
deallocate product_attribute_cursor			
END
CLOSE attribute_cursor
DEALLOCATE 	attribute_cursor
end