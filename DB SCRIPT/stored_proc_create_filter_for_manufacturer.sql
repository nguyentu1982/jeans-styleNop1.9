USE [JeanStyle]
GO
/****** Object:  StoredProcedure [dbo].[Nop_SpecificationAttributeOptionFilter_LoadByFilter]    Script Date: 07/31/2011 18:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Nop_SpecificationAttributeOptionFilterManufacturer_LoadByFilter]
(
	@ManufacturerID int,
	@LanguageID int
)
AS
BEGIN
	SELECT 
		sa.SpecificationAttributeId,
		dbo.NOP_getnotnullnotempty(sal.Name,sa.Name) as [SpecificationAttributeName],
		sa.DisplayOrder,
		sao.SpecificationAttributeOptionId,
		dbo.NOP_getnotnullnotempty(saol.Name,sao.Name) as [SpecificationAttributeOptionName]
	FROM Nop_Product_SpecificationAttribute_Mapping psam with (NOLOCK)
		INNER JOIN Nop_SpecificationAttributeOption sao with (NOLOCK) ON
			sao.SpecificationAttributeOptionID = psam.SpecificationAttributeOptionID
		INNER JOIN Nop_SpecificationAttribute sa with (NOLOCK) ON
			sa.SpecificationAttributeID = sao.SpecificationAttributeID	
		INNER JOIN Nop_Product_Manufacturer_Mapping pcm with (NOLOCK) ON 
			pcm.ProductID = psam.ProductID	
		INNER JOIN Nop_Product p ON 
			psam.ProductID = p.ProductID
		LEFT OUTER JOIN Nop_ProductVariant pv with (NOLOCK) ON 
			p.ProductID = pv.ProductID
		LEFT OUTER JOIN [Nop_SpecificationAttributeLocalized] sal with (NOLOCK) ON 
			sa.SpecificationAttributeID = sal.SpecificationAttributeID AND sal.LanguageID = @LanguageID	
		LEFT OUTER JOIN [Nop_SpecificationAttributeOptionLocalized] saol with (NOLOCK) ON 
			sao.SpecificationAttributeOptionID = saol.SpecificationAttributeOptionID AND saol.LanguageID = @LanguageID	
	WHERE 
			p.Published = 1
		AND 
			pv.Published = 1
		AND 
			p.Deleted=0
		AND
			pcm.ManufacturerID = @ManufacturerID
		AND
			psam.AllowFiltering = 1
		AND
			getutcdate() between isnull(pv.AvailableStartDateTime, '1/1/1900') and isnull(pv.AvailableEndDateTime, '1/1/2999')
	GROUP BY
		sa.SpecificationAttributeID, 
		dbo.NOP_getnotnullnotempty(sal.Name,sa.Name),
		sa.DisplayOrder,
		sao.SpecificationAttributeOptionID,
		dbo.NOP_getnotnullnotempty(saol.Name,sao.Name)
	ORDER BY sa.DisplayOrder, [SpecificationAttributeName], [SpecificationAttributeOptionName]
END
