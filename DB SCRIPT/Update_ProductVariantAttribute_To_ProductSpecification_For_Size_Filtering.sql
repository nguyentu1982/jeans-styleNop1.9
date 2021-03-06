select * from dbo.Nop_Product

select * from dbo.Nop_ProductVariant_ProductAttribute_Mapping

select * from dbo.Nop_ProductVariantAttributeCombination.AttributesXML.nodes('/Attributes/ProductVariantAttribute/ProductVariantAttributeValue/Value') as APA(ProductVariantAttribute)


select * from Nop_ProductVariantAttributeCombination
--------------------------
IF EXISTS
(
SELECT *
FROM tempdb.dbo.sysobjects
WHERE ID = OBJECT_ID(N'tempdb..#Temp')
)
BEGIN
DROP TABLE #Temp
END
go
SELECT 
PV.ProductID,
PV.ProductVariantID,
AttributesXML.value('(/Attributes//ProductVariantAttribute/@ID)[1]', 'int') as ProductVariantAttributeID,
AttributesXML.value('(/Attributes//ProductVariantAttribute/node())[1]', 'int') as ProductVariantAttributeValueID
into #Temp
FROM Nop_ProductVariantAttributeCombination PVAC
inner join dbo.Nop_ProductVariant PV
on PVAC.ProductVariantID = PV.ProductVariantId

select T.ProductId,PVAV.Name  from #Temp T
inner join dbo.Nop_ProductVariantAttributeValue PVAV
on PVAV.ProductVariantAttributeValueID = T.ProductVariantAttributeValueID
inner join dbo.Nop_ProductAttribute PA
on PA.Name = 'Size'
-------------------------------------------

select PSAM.ProductID, SA.Name as SpecificationName, SAO.Name from dbo.Nop_Product_SpecificationAttribute_Mapping PSAM
inner join dbo.Nop_SpecificationAttributeOption SAO
on PSAM.SpecificationAttributeOptionID = SAO.SpecificationAttributeOptionID
inner join dbo.Nop_SpecificationAttribute SA
on SA.SpecificationAttributeID = SAO.SpecificationAttributeID
where SA.Name = N'Size hiện có'
or SA.Name = N'Size'



select P.ProductId, PA.Name, PVAV.Name from dbo.Nop_ProductVariantAttributeValue PVAV
inner join dbo.Nop_ProductVariant_ProductAttribute_Mapping PVPAM
on PVAV.ProductVariantAttributeID = PVPAM.ProductVariantAttributeID
inner join dbo.Nop_ProductVariant PV
on PV.ProductVariantId = PVPAM.ProductVariantID
inner join dbo.Nop_Product P
on P.ProductId = PV.ProductID
inner join Nop_ProductAttribute PA
on PA.ProductAttributeID = PVPAM.ProductAttributeID

select PSM.ProductID, SA.Name, SAO.Name from dbo.Nop_Product_SpecificationAttribute_Mapping PSM
inner join Nop_SpecificationAttributeOption SAO
on PSM.SpecificationAttributeOptionID = SAO.SpecificationAttributeOptionID
inner join Nop_SpecificationAttribute SA
on SA.SpecificationAttributeID = SAO.SpecificationAttributeID
where SA.Name = N'Size hiện có'

