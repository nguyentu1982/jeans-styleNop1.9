//------------------------------------------------------------------------------
// The contents of this file are subject to the nopCommerce Public License Version 1.0 ("License"); you may not use this file except in compliance with the License.
// You may obtain a copy of the License at  http://www.nopCommerce.com/License.aspx. 
// 
// Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. 
// See the License for the specific language governing rights and limitations under the License.
// 
// The Original Code is nopCommerce.
// The Initial Developer of the Original Code is NopSolutions.
// All Rights Reserved.
// 
// Contributor(s): _______. 
//------------------------------------------------------------------------------

using System;
using NopSolutions.NopCommerce.BusinessLogic.CustomerManagement;
using NopSolutions.NopCommerce.BusinessLogic.Infrastructure;
using Service = NopSolutions.NopCommerce.BusinessLogic.Content.ServiceManagement;

namespace NopSolutions.NopCommerce.BusinessLogic.Content.ServiceManagement
{
    /// <summary>
    /// Represents a news comment
    /// </summary>
    public partial class ServiceComment : BaseEntity
    {
        #region Properties
        /// <summary>
        /// Gets or sets the news comment identifier
        /// </summary>
        public int ServiceCommentId { get; set; }

        /// <summary>
        /// Gets or sets the news identifier
        /// </summary>
        public int ServiceId { get; set; }

        /// <summary>
        /// Gets or sets the customer identifier
        /// </summary>
        public int CustomerId { get; set; }

        /// <summary>
        /// Gets or sets the IP address
        /// </summary>
        public string IPAddress { get; set; }

        /// <summary>
        /// Gets or sets the title
        /// </summary>
        public string Title { get; set; }

        /// <summary>
        /// Gets or sets the comment
        /// </summary>
        public string Comment { get; set; }

        /// <summary>
        /// Gets or sets the date and time of instance creation
        /// </summary>
        public DateTime CreatedOn { get; set; }

        #endregion

        #region Custom Properties
        /// <summary>
        /// Gets the news
        /// </summary>
        public Service Service
        {
            get
            {
                return IoC.Resolve<IServiceService>().GetServiceById(this.ServiceId);
            }
        }

        /// <summary>
        /// Gets the customer
        /// </summary>
        public Customer Customer
        {
            get
            {
                return IoC.Resolve<ICustomerService>().GetCustomerById(this.CustomerId);
            }
        }
        #endregion

        #region Navigation Properties

        /// <summary>
        /// Gets the news item
        /// </summary>
        public virtual Service NpService { get; set; }
        
        #endregion
    }
}