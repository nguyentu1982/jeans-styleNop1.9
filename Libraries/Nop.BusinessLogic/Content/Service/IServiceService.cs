//------------------------------------------------------------------------------
// The contents of this file are subject to the nopCommerce License Version 1.0 ("License"); you may not use this file except in compliance with the License.
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
using System.Collections.Generic;
using NopSolutions.NopCommerce.Common;

namespace NopSolutions.NopCommerce.BusinessLogic.Content.ServiceManagement
{
    /// <summary>
    /// News service interface
    /// </summary>
    public partial interface IServiceService
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="serviceId"></param>
        /// <returns></returns>
        Service GetServiceById(int serviceId);

        /// <summary>
        /// 
        /// </summary>
        /// <param name="serviceId"></param>
        void DeleteService(int serviceId);

        /// <summary>
        /// 
        /// </summary>
        /// <param name="languageId"></param>
        /// <returns></returns>
        List<Service> GetAllService(int languageId);

        /// <summary>
        /// Gets service item collection
        /// </summary>
        /// <param name="languageId">Language identifier. 0 if you want to get all news</param>
        /// <param name="showHidden">A value indicating whether to show hidden records</param>
        /// <returns>Service item collection</returns>
        List<Service> GetAllService(int languageId, bool showHidden);

        /// <summary>
        /// Gets Service item collection
        /// </summary>
        /// <param name="languageId">Language identifier. 0 if you want to get all news</param>
        /// <param name="count">Service count to return</param>
        /// <returns>Service item collection</returns>
        List<Service> GetAllService(int languageId, int count);

        /// <summary>
        /// Gets Service item collection
        /// </summary>
        /// <param name="languageId">Language identifier. 0 if you want to get all news</param>
        /// <param name="showHidden">A value indicating whether to show hidden records</param>
        /// <param name="count">Service count to return</param>
        /// <returns>Service item collection</returns>
        List<Service> GetAllService(int languageId, bool showHidden, int count);

        /// <summary>
        /// Gets Service item collection
        /// </summary>
        /// <param name="languageId">Language identifier. 0 if you want to get all news</param>
        /// <param name="pageSize">Page size</param>
        /// <param name="pageIndex">Page index</param>
        /// <returns>Service item collection</returns>
        PagedList<Service> GetAllService(int languageId, int pageIndex, int pageSize);

        /// <summary>
        /// Gets Service item collection
        /// </summary>
        /// <param name="languageId">Language identifier. 0 if you want to get all news</param>
        /// <param name="showHidden">A value indicating whether to show hidden records</param>
        /// <param name="pageSize">Page size</param>
        /// <param name="pageIndex">Page index</param>
        /// <returns>Service item collection</returns>
        PagedList<Service> GetAllService(int languageId, bool showHidden,
            int pageIndex, int pageSize);

        /// <summary>
        /// Inserts a Service item
        /// </summary>
        /// <param name="Service">Service item</param>
        void InsertService(Service service);

        /// <summary>
        /// Updates the Service item
        /// </summary>
        /// <param name="Service">Service item</param>
        void UpdateService(Service Service);

        /// <summary>
        /// Gets a Service comment
        /// </summary>
        /// <param name="serviceCommentId">Service comment identifer</param>
        /// <returns>Service comment</returns>
        ServiceComment GetServiceCommentById(int serviceCommentId);

        /// <summary>
        /// Gets a Service comment collection by Service identifier
        /// </summary>
        /// <param name="newsId">The Service identifier</param>
        /// <returns>Service comment collection</returns>
        List<ServiceComment> GetServiceCommentsByServiceId(int ServiceId);

        /// <summary>
        /// Deletes a Service comment
        /// </summary>
        /// <param name="serviceCommentId">The Service comment identifier</param>
        void DeleteServiceComment(int serviceCommentId);

        /// <summary>
        /// Gets all Service comments
        /// </summary>
        /// <returns>Service comment collection</returns>
        List<ServiceComment> GetAllServiceComments();

        /// <summary>
        /// Inserts a Service comment
        /// </summary>
        /// <param name="serviceId">The Service identifier</param>
        /// <param name="customerId">The customer identifier</param>
        /// <param name="title">The title</param>
        /// <param name="comment">The comment</param>
        /// <param name="createdOn">The date and time of instance creation</param>
        /// <returns>Service comment</returns>
        ServiceComment InsertServiceComment(int serviceId, int customerId,
            string title, string comment, DateTime createdOn);

        /// <summary>
        /// Inserts a Service comment
        /// </summary>
        /// <param name="serviceId">The Service identifier</param>
        /// <param name="customerId">The customer identifier</param>
        /// <param name="title">The title</param>
        /// <param name="comment">The comment</param>
        /// <param name="createdOn">The date and time of instance creation</param>
        /// <param name="notify">A value indicating whether to notify the store owner</param>
        /// <returns>Service comment</returns>
        ServiceComment InsertServiceComment(int serviceId, int customerId,
            string title, string comment, DateTime createdOn, bool notify);

        /// <summary>
        /// Inserts a Service comment
        /// </summary>
        /// <param name="serviceId">The Service identifier</param>
        /// <param name="customerId">The customer identifier</param>
        /// <param name="ipAddress">The IP address</param>
        /// <param name="title">The title</param>
        /// <param name="comment">The comment</param>
        /// <param name="createdOn">The date and time of instance creation</param>
        /// <param name="notify">A value indicating whether to notify the store owner</param>
        /// <returns>Service comment</returns>
        ServiceComment InsertServiceComment(int serviceId, int customerId, string ipAddress,
            string title, string comment, DateTime createdOn, bool notify);

        /// <summary>
        /// Updates the Service comment
        /// </summary>
        /// <param name="serviceComment">Service comment</param>
        void UpdateServiceComment(ServiceComment serviceComment);
        
        /// <summary>
        /// Gets or sets a value indicating whether Service are enabled
        /// </summary>
        bool ServiceEnabled { get; set; }

        /// <summary>
        /// Gets or sets a value indicating whether not registered user can leave comments
        /// </summary>
        bool AllowNotRegisteredUsersToLeaveComments { get; set; }

        /// <summary>
        /// Gets or sets a value indicating whether to notify about new Service comments
        /// </summary>
        bool NotifyAboutNewServiceComments { get; set; }

        /// <summary>
        /// Gets or sets a value indicating whether to show Service on the main page
        /// </summary>
        bool ShowServiceOnMainPage { get; set; }

        /// <summary>
        /// Gets or sets a value indicating Service count displayed on the main page
        /// </summary>
        int MainPageServiceCount { get; set; }

        /// <summary>
        /// Gets or sets the page size for Service archive
        /// </summary>
        int ServiceArchivePageSize { get; set; }

        

    }
}
