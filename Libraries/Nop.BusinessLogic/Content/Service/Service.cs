using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NopSolutions.NopCommerce.BusinessLogic.Directory;
using NopSolutions.NopCommerce.BusinessLogic.Infrastructure;
using NopSolutions.NopCommerce.BusinessLogic.Media;

namespace NopSolutions.NopCommerce.BusinessLogic.Content.ServiceManagement
{
    public partial class Service : BaseEntity
    {
        #region Properties
        /// <summary>
        /// Gets or sets the news identifier
        /// </summary>
        public int ServiceId { get; set; }

        /// <summary>
        /// Gets or sets the language identifier
        /// </summary>
        public int LanguageId { get; set; }

        /// <summary>
        /// Gets or sets the news title
        /// </summary>
        public string Title { get; set; }

        /// <summary>
        /// Gets or sets the short text
        /// </summary>
        public string Short { get; set; }

        /// <summary>
        /// Gets or sets the full text
        /// </summary>
        public string Full { get; set; }

        /// <summary>
        /// Gets or sets a value indicating whether the entity is published
        /// </summary>
        public bool Published { get; set; }

        /// <summary>
        /// Gets or sets a value indicating whether the entity allows comments
        /// </summary>
        public bool AllowComments { get; set; }

        /// <summary>
        /// Gets or sets the date and time of instance creation
        /// </summary>
        public DateTime CreatedOn { get; set; }

        public int PictureId { get; set; }

        #endregion

        #region Custom Properties
        /// <summary>
        /// Gets the language
        /// </summary>
        public Language Language
        {
            get
            {
                return IoC.Resolve<ILanguageService>().GetLanguageById(this.LanguageId);
            }
        }

        /// <summary>
        /// Gets the news comments
        /// </summary>
        public List<ServiceComment> ServiceComments
        {
            get
            {
                return IoC.Resolve<ServiceService>().GetServiceCommentsByServiceId(this.ServiceId);
            }
        }

        public Picture Picture
        {
            get
            {
                return IoC.Resolve<IPictureService>().GetPictureById(this.PictureId);
            }
        }
        #endregion

        #region Navigation Properties

        /// <summary>
        /// Gets the news comments
        /// </summary>
        public virtual ICollection<ServiceComment> NpServiceComments { get; set; }

        /// <summary>
        /// Gets the language
        /// </summary>
        public virtual Language NpLanguage { get; set; }

        public virtual Picture NpPicture { get; set; } 
        
        #endregion
    }
}
