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
using System.Collections.Generic;
using System.Linq;
using NopSolutions.NopCommerce.BusinessLogic.Caching;
using NopSolutions.NopCommerce.BusinessLogic.Configuration.Settings;
using NopSolutions.NopCommerce.BusinessLogic.Data;
using NopSolutions.NopCommerce.BusinessLogic.Infrastructure;
using NopSolutions.NopCommerce.BusinessLogic.Localization;
using NopSolutions.NopCommerce.BusinessLogic.Messages;
using NopSolutions.NopCommerce.Common;
using NopSolutions.NopCommerce.Common.Utils;
using NopSolutions.NopCommerce.BusinessLogic.Media;

namespace NopSolutions.NopCommerce.BusinessLogic.Content.ServiceManagement
{
    /// <summary>
    /// Service service
    /// </summary>
    public partial class ServiceService : IServiceService
    {
        #region Constants
        private const string SERVICE_BY_ID_KEY = "Nop.service.id-{0}";
        private const string SERVICE_PATTERN_KEY = "Nop.service.";
        #endregion

        #region Fields

        /// <summary>
        /// Object context
        /// </summary>
        private readonly NopObjectContext _context;

        /// <summary>
        /// Cache manager
        /// </summary>
        private readonly ICacheManager _cacheManager;

        #endregion

        #region Ctor

        /// <summary>
        /// Ctor
        /// </summary>
        /// <param name="context">Object context</param>
        public ServiceService(NopObjectContext context)
        {
            this._context = context;
            this._cacheManager = new NopRequestCache();
        }

        #endregion

        #region Methods

        /// <summary>
        /// Gets a service
        /// </summary>
        /// <param name="serviceId">The service identifier</param>
        /// <returns>Service</returns>
        public Service GetServiceById(int serviceId)
        {
            if (serviceId == 0)
                return null;

            string key = string.Format(SERVICE_BY_ID_KEY, serviceId);
            object obj2 = _cacheManager.Get(key);
            if (this.CacheEnabled && (obj2 != null))
            {
                return (Service)obj2;
            }

            
            var query = from n in _context.Service
                        where n.ServiceId == serviceId
                        select n;
            var service = query.SingleOrDefault();

            if (this.CacheEnabled)
            {
                _cacheManager.Add(key, service);
            }
            return service;
        }

        /// <summary>
        /// Deletes a service
        /// </summary>
        /// <param name="serviceId">The service identifier</param>
        public void DeleteService(int serviceId)
        {
            var service = GetServiceById(serviceId);
            if (service == null)
                return;

            
            if (!_context.IsAttached(service))
                _context.Service.Attach(service);
            _context.DeleteObject(service);
            _context.SaveChanges();

            if (this.CacheEnabled)
            {
                _cacheManager.RemoveByPattern(SERVICE_PATTERN_KEY);
            }
        }

        /// <summary>
        /// Gets all service
        /// </summary>
        /// <param name="languageId">Language identifier. 0 if you want to get all service</param>
        /// <returns>Service item collection</returns>
        public List<Service> GetAllService(int languageId)
        {
            bool showHidden = NopContext.Current.IsAdmin;
            return GetAllService(languageId, showHidden);
        }

        /// <summary>
        /// Gets service item collection
        /// </summary>
        /// <param name="languageId">Language identifier. 0 if you want to get all service</param>
        /// <param name="showHidden">A value indicating whether to show hidden records</param>
        /// <returns>Service item collection</returns>
        public List<Service> GetAllService(int languageId, bool showHidden)
        {
            return GetAllService(languageId, showHidden, Int32.MaxValue);
        }
        
        /// <summary>
        /// Gets service item collection
        /// </summary>
        /// <param name="languageId">Language identifier. 0 if you want to get all service</param>
        /// <param name="count">Service count to return</param>
        /// <returns>Service item collection</returns>
        public List<Service> GetAllService(int languageId, int count)
        {
            bool showHidden = NopContext.Current.IsAdmin;
            return GetAllService(languageId, showHidden, count);
        }

        /// <summary>
        /// Gets service item collection
        /// </summary>
        /// <param name="languageId">Language identifier. 0 if you want to get all service</param>
        /// <param name="showHidden">A value indicating whether to show hidden records</param>
        /// <param name="count">Service count to return</param>
        /// <returns>Service item collection</returns>
        public List<Service> GetAllService(int languageId, bool showHidden, int count)
        {
            return GetAllService(languageId, showHidden, 0, count);
        }

        /// <summary>
        /// Gets service item collection
        /// </summary>
        /// <param name="languageId">Language identifier. 0 if you want to get all service</param>
        /// <param name="pageSize">Page size</param>
        /// <param name="pageIndex">Page index</param>
        /// <returns>Service item collection</returns>
        public PagedList<Service> GetAllService(int languageId, int pageIndex, int pageSize)
        {
            bool showHidden = NopContext.Current.IsAdmin;
            return GetAllService(languageId, showHidden, pageIndex, pageSize);
        }

        /// <summary>
        /// Gets service item collection
        /// </summary>
        /// <param name="languageId">Language identifier. 0 if you want to get all service</param>
        /// <param name="showHidden">A value indicating whether to show hidden records</param>
        /// <param name="pageSize">Page size</param>
        /// <param name="pageIndex">Page index</param>
        /// <returns>Service item collection</returns>
        public PagedList<Service> GetAllService(int languageId, bool showHidden, 
            int pageIndex, int pageSize)
        {
            if(pageSize <= 0)
            {
                pageSize = 10;
            }
            if(pageSize == Int32.MaxValue)
            {
                pageSize = Int32.MaxValue - 1;
            }
            if(pageIndex < 0)
            {
                pageIndex = 0;
            }
            if(pageIndex == Int32.MaxValue)
            {
                pageIndex = Int32.MaxValue - 1;
            }

            
            var query = from n in _context.Service
                        where (showHidden || n.Published) &&
                        (languageId == 0 || languageId == n.LanguageId)
                        orderby n.CreatedOn descending
                        select n;
            var service = new PagedList<Service>(query, pageIndex, pageSize);
            return service;
        }

        /// <summary>
        /// Inserts a service item
        /// </summary>
        /// <param name="service">Service item</param>
        public void InsertService(Service service)
        {
            if (service == null)
                throw new ArgumentNullException("service");

            service.Title = CommonHelper.EnsureNotNull(service.Title);
            service.Title = CommonHelper.EnsureMaximumLength(service.Title, 1000);
            service.Short = CommonHelper.EnsureNotNull(service.Short);
            service.Short = CommonHelper.EnsureMaximumLength(service.Short, 4000);
            service.Full = CommonHelper.EnsureNotNull(service.Full);
            
            
            _context.Service.AddObject(service);
            _context.SaveChanges();

            if (this.CacheEnabled)
            {
                _cacheManager.RemoveByPattern(SERVICE_PATTERN_KEY);
            }
        }

        /// <summary>
        /// Updates the service item
        /// </summary>
        /// <param name="service">Service item</param>
        public void UpdateService(Service service)
        {
            if (service == null)
                throw new ArgumentNullException("service");

            service.Title = CommonHelper.EnsureNotNull(service.Title);
            service.Title = CommonHelper.EnsureMaximumLength(service.Title, 1000);
            service.Short = CommonHelper.EnsureNotNull(service.Short);
            service.Short = CommonHelper.EnsureMaximumLength(service.Short, 4000);
            service.Full = CommonHelper.EnsureNotNull(service.Full);
            
            
            if (!_context.IsAttached(service))
                _context.Service.Attach(service);

            _context.SaveChanges();

            if (this.CacheEnabled)
            {
                _cacheManager.RemoveByPattern(SERVICE_PATTERN_KEY);
            }
        }

        /// <summary>
        /// Gets a service comment
        /// </summary>
        /// <param name="serviceCommentId">Service comment identifer</param>
        /// <returns>Service comment</returns>
        public ServiceComment GetServiceCommentById(int serviceCommentId)
        {
            if (serviceCommentId == 0)
                return null;

            
            var query = from nc in _context.ServiceComments
                        where nc.ServiceCommentId == serviceCommentId
                        select nc;
            var serviceComment = query.SingleOrDefault();
            return serviceComment;
        }

        /// <summary>
        /// Gets a service comment collection by service identifier
        /// </summary>
        /// <param name="serviceId">The service identifier</param>
        /// <returns>Service comment collection</returns>
        public List<ServiceComment> GetServiceCommentsByServiceId(int serviceId)
        {
            
            var query = from nc in _context.ServiceComments
                        orderby nc.CreatedOn
                        where nc.ServiceId == serviceId
                        select nc;
            var serviceComments = query.ToList();
            return serviceComments;
        }

        /// <summary>
        /// Deletes a service comment
        /// </summary>
        /// <param name="serviceCommentId">The service comment identifier</param>
        public void DeleteServiceComment(int serviceCommentId)
        {
            var serviceComment = GetServiceCommentById(serviceCommentId);
            if (serviceComment == null)
                return;

            
            if (!_context.IsAttached(serviceComment))
                _context.ServiceComments.Attach(serviceComment);
            _context.DeleteObject(serviceComment);
            _context.SaveChanges();
        }

        /// <summary>
        /// Gets all service comments
        /// </summary>
        /// <returns>Service comment collection</returns>
        public List<ServiceComment> GetAllServiceComments()
        {
            
            var query = from nc in _context.ServiceComments
                        orderby nc.CreatedOn
                        select nc;
            var serviceComments = query.ToList();
            return serviceComments;
        }

        /// <summary>
        /// Inserts a service comment
        /// </summary>
        /// <param name="serviceId">The service identifier</param>
        /// <param name="customerId">The customer identifier</param>
        /// <param name="title">The title</param>
        /// <param name="comment">The comment</param>
        /// <param name="createdOn">The date and time of instance creation</param>
        /// <returns>Service comment</returns>
        public ServiceComment InsertServiceComment(int serviceId, int customerId,
            string title, string comment, DateTime createdOn)
        {
            return InsertServiceComment(serviceId, customerId, title, comment, 
                createdOn, this.NotifyAboutNewServiceComments);
        }

        /// <summary>
        /// Inserts a service comment
        /// </summary>
        /// <param name="serviceId">The service identifier</param>
        /// <param name="customerId">The customer identifier</param>
        /// <param name="title">The title</param>
        /// <param name="comment">The comment</param>
        /// <param name="createdOn">The date and time of instance creation</param>
        /// <param name="notify">A value indicating whether to notify the store owner</param>
        /// <returns>Service comment</returns>
        public ServiceComment InsertServiceComment(int serviceId, int customerId,
            string title, string comment, DateTime createdOn, bool notify)
        {
            string IPAddress = NopContext.Current.UserHostAddress;
            return InsertServiceComment(serviceId, customerId, IPAddress, title, comment, createdOn, notify);
        }

        /// <summary>
        /// Inserts a service comment
        /// </summary>
        /// <param name="serviceId">The service identifier</param>
        /// <param name="customerId">The customer identifier</param>
        /// <param name="ipAddress">The IP address</param>
        /// <param name="title">The title</param>
        /// <param name="comment">The comment</param>
        /// <param name="createdOn">The date and time of instance creation</param>
        /// <param name="notify">A value indicating whether to notify the store owner</param>
        /// <returns>Service comment</returns>
        public ServiceComment InsertServiceComment(int serviceId, int customerId, string ipAddress,
            string title, string comment, DateTime createdOn, bool notify)
        {
            ipAddress = CommonHelper.EnsureNotNull(ipAddress);
            ipAddress = CommonHelper.EnsureMaximumLength(ipAddress, 100);
            title = CommonHelper.EnsureNotNull(title);
            title = CommonHelper.EnsureMaximumLength(title, 1000);
            comment = CommonHelper.EnsureNotNull(comment);

            

            var serviceComment = _context.ServiceComments.CreateObject();
            serviceComment.ServiceId = serviceId;
            serviceComment.CustomerId = customerId;
            serviceComment.IPAddress = ipAddress;
            serviceComment.Title = title;
            serviceComment.Comment = comment;
            serviceComment.CreatedOn = createdOn;

            _context.ServiceComments.AddObject(serviceComment);
            _context.SaveChanges();
            
            //notifications
            if (notify)
            {
                IoC.Resolve<IMessageService>().SendServiceCommentNotificationMessage(serviceComment, IoC.Resolve<ILocalizationManager>().DefaultAdminLanguage.LanguageId);
            }

            return serviceComment;
        }

        /// <summary>
        /// Updates the service comment
        /// </summary>
        /// <param name="serviceComment">Service comment</param>
        public void UpdateServiceComment(ServiceComment serviceComment)
        {
            if (serviceComment == null)
                throw new ArgumentNullException("serviceComment");

            serviceComment.IPAddress = CommonHelper.EnsureNotNull(serviceComment.IPAddress);
            serviceComment.IPAddress = CommonHelper.EnsureMaximumLength(serviceComment.IPAddress, 100);
            serviceComment.Title = CommonHelper.EnsureNotNull(serviceComment.Title);
            serviceComment.Title = CommonHelper.EnsureMaximumLength(serviceComment.Title, 1000);
            serviceComment.Comment = CommonHelper.EnsureNotNull(serviceComment.Comment);

            
            if (!_context.IsAttached(serviceComment))
                _context.ServiceComments.Attach(serviceComment);

            _context.SaveChanges();
        }

        
        #endregion

        #region Properties

        /// <summary>
        /// Gets a value indicating whether cache is enabled
        /// </summary>
        public bool CacheEnabled
        {
            get
            {
                return IoC.Resolve<ISettingManager>().GetSettingValueBoolean("Cache.ServiceManager.CacheEnabled");
            }
        }
        
        /// <summary>
        /// Gets or sets a value indicating whether service are enabled
        /// </summary>
        public bool ServiceEnabled
        {
            get
            {
                bool serviceEnabled = IoC.Resolve<ISettingManager>().GetSettingValueBoolean("Service.ServiceEnabled");
                return serviceEnabled;
            }
            set
            {
                IoC.Resolve<ISettingManager>().SetParam("Service.ServiceEnabled", value.ToString());
            }
        }

        /// <summary>
        /// Gets or sets a value indicating whether not registered user can leave comments
        /// </summary>
        public bool AllowNotRegisteredUsersToLeaveComments
        {
            get
            {
                return IoC.Resolve<ISettingManager>().GetSettingValueBoolean("Service.AllowNotRegisteredUsersToLeaveComments");
            }
            set
            {
                IoC.Resolve<ISettingManager>().SetParam("Service.AllowNotRegisteredUsersToLeaveComments", value.ToString());
            }
        }

        /// <summary>
        /// Gets or sets a value indicating whether to notify about new service comments
        /// </summary>
        public bool NotifyAboutNewServiceComments
        {
            get
            {
                return IoC.Resolve<ISettingManager>().GetSettingValueBoolean("Service.NotifyAboutNewServiceComments");
            }
            set
            {
                IoC.Resolve<ISettingManager>().SetParam("Service.NotifyAboutNewServiceComments", value.ToString());
            }
        }

        /// <summary>
        /// Gets or sets a value indicating whether to show service on the main page
        /// </summary>
        public bool ShowServiceOnMainPage
        {
            get
            {
                bool showServiceOnMainPage = IoC.Resolve<ISettingManager>().GetSettingValueBoolean("Display.ShowServiceOnMainPage");
                return showServiceOnMainPage;
            }
            set
            {
                IoC.Resolve<ISettingManager>().SetParam("Display.ShowServiceOnMainPage", value.ToString());
            }
        }

        /// <summary>
        /// Gets or sets a value indicating service count displayed on the main page
        /// </summary>
        public int MainPageServiceCount
        {
            get
            {
                int mainPageServiceCount = IoC.Resolve<ISettingManager>().GetSettingValueInteger("Display.MainPageServiceCount");
                return mainPageServiceCount;
            }
            set
            {
                IoC.Resolve<ISettingManager>().SetParam("Display.MainPageServiceCount", value.ToString());
            }
        }

        /// <summary>
        /// Gets or sets the page size for service archive
        /// </summary>
        public int ServiceArchivePageSize
        {
            get
            {
                return IoC.Resolve<ISettingManager>().GetSettingValueInteger("Display.ServiceArchivePageSize", 10);
            }
            set
            {
                IoC.Resolve<ISettingManager>().SetParam("Display.ServiceArchivePageSize", value.ToString());
            }
        }


        #endregion
    }
}
