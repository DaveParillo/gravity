/** (C) Copyright 2013, Applied Physical Sciences Corp., A General Dynamics Company
 **
 ** Gravity is free software; you can redistribute it and/or modify
 ** it under the terms of the GNU Lesser General Public License as published by
 ** the Free Software Foundation; either version 3 of the License, or
 ** (at your option) any later version.
 **
 ** This program is distributed in the hope that it will be useful,
 ** but WITHOUT ANY WARRANTY; without even the implied warranty of
 ** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 ** GNU Lesser General Public License for more details.
 **
 ** You should have received a copy of the GNU Lesser General Public
 ** License along with this program;
 ** If not, see <http://www.gnu.org/licenses/>.
 **
 */


// this turns on director features for CPPGravitySubscriber
//%feature("director") gravity::CPPGravitySubscriber;
//%feature("director") gravity::CPPGravityRequestor;
//%feature("director") gravity::CPPGravityServiceProvider;
//%feature("director") gravity::CPPGravityHeartbeatListener;
//%feature("director") gravity::CPPGravitySubscriptionMonitor;

// This is where we actually declare the types and methods that will be made available in Java.  This section must be kept in
// sync with the Gravity API.
namespace gravity {

/*
	class CPPGravitySubscriber {
	public:
		virtual ~CPPGravitySubscriber();
		virtual int subscriptionFilled(char *BYTE, int byteLength, int *INTEGER, int intLength);
	};

	class CPPGravityRequestor {
	public:
		virtual ~CPPGravityRequestor();
		virtual char requestFilled(const std::string& serviceID, const std::string& requestID, char *BYTE, int byteLength);
	};

	class CPPGravityServiceProvider {
	public:
	   virtual ~CPPGravityServiceProvider();
	   virtual shared_ptr<gravity::GravityDataProduct> request(const std::string serviceID, char *BYTE, int byteLength);
	};

	class CPPGravityHeartbeatListener
	{
	public:
      virtual ~CPPGravityHeartbeatListener();
      virtual int64_t MissedHeartbeatJava(const std::string dataProductID, int64_t microsecond_to_last_heartbeat, int64_t& INOUT);
      virtual int64_t ReceivedHeartbeatJava(const std::string dataProductID, int64_t& INOUT);
	};
	
	class CPPGravitySubscriptionMonitor {
	public:
		virtual ~CPPGravitySubscriptionMonitor();
		virtual void subscriptionTimeoutJava(const std::string& dataProductID, int milliSecondsSinceLast,const std::string& filter, const std::string& domain);
	};
*/
	namespace GravityReturnCodes {
		enum Codes {
	        SUCCESS = 0,
	        FAILURE = -1,
	        NO_SERVICE_DIRECTORY = -2,
	        REQUEST_TIMEOUT = -3,
	        DUPLICATE = -4,
	        REGISTRATION_CONFLICT = -5,
	        NOT_REGISTERED = -6,
	        NO_SUCH_SERVICE = -7,
	        LINK_ERROR = -8,
	        INTERRUPTED = -9,
	        NO_SERVICE_PROVIDER = -10,
	        NO_PORTS_AVAILABLE = -11,
			INVALID_PARAMETER = -12
	    };
	};
	typedef GravityReturnCodes::Codes GravityReturnCode;
	
	
	namespace GravityTransportTypes
	{
	    enum Types {
	        TCP = 0,
	        INPROC = 1,
	        PGM = 2,
	        EPGM= 3,
	#ifndef WIN32
	        IPC = 4
	#endif
	    };
    };
	typedef GravityTransportTypes::Types GravityTransportType;


class GravityNode {
public:
    GravityNode();
	GravityNode(std::string);
    ~GravityNode();
	GravityReturnCode init();
    GravityReturnCode init(std::string);
    void waitForExit();
	GravityReturnCode registerDataProduct(const std::string& dataProductID, const GravityTransportType& transportType);
    GravityReturnCode registerDataProduct(const std::string& dataProductID, const GravityTransportType& transportType, bool cacheLastValue);    
	GravityReturnCode unregisterDataProduct(const std::string& dataProductID);

	GravityReturnCode subscribe(const std::string& dataProductID, const gravity::GravitySubscriber& subscriber);
	GravityReturnCode subscribe(const std::string& dataProductID, const gravity::GravitySubscriber& subscriber, const std::string& filter);
	GravityReturnCode subscribe(const std::string& dataProductID, const gravity::GravitySubscriber& subscriber, const std::string& filter, const std::string& domain);
	GravityReturnCode subscribe(const std::string& dataProductID, const gravity::GravitySubscriber& subscriber, const std::string& filter, const std::string& domain, bool receiveLastCachedValue);
    
    GravityReturnCode unsubscribe(const std::string& dataProductID, const gravity::GravitySubscriber& subscriber, const std::string& filter = "", const std::string& domain = "");

    GravityReturnCode publish(const gravity::GravityDataProduct& dataProduct, const std::string& filter = "", unsigned long timestamp = 0);

    GravityReturnCode request(const std::string& serviceID, const gravity::GravityDataProduct& dataProduct,
	        const gravity::GravityRequestor& requestor, const std::string& requestID = "", int timeout_milliseconds = -1, const std::string& domain = "");
    shared_ptr<gravity::GravityDataProduct> request(const std::string& serviceID, const gravity::GravityDataProduct& request, int timeout_milliseconds = -1, const std::string& domain = "");

    GravityReturnCode registerService(const std::string& serviceID, const GravityTransportType& transportType,
    		const gravity::GravityServiceProvider& server);
    GravityReturnCode unregisterService(const std::string& serviceID);

    GravityReturnCode startHeartbeat(unsigned long interval_in_microseconds);
    GravityReturnCode stopHeartbeat();
    GravityReturnCode registerHeartbeatListener(const std::string& dataProductID, long timebetweenMessages, 
		const gravity::GravityHeartbeatListener& listener, const std::string& domain = "");
	GravityReturnCode unregisterHeartbeatListener(const std::string& dataProductID, const std::string &domain = "");

    std::string getStringParam(std::string key, std::string default_value = "");
    int getIntParam(std::string key, int default_value = -1);
    double getFloatParam(std::string key, double default_value = 0.0);
    bool getBoolParam(std::string key, bool default_value = false);
    std::string getComponentID();
	std::string getIP();
    std::string getDomain();

    shared_ptr<gravity::FutureResponse> createFutureResponse();
	GravityReturnCode sendFutureResponse(const gravity::FutureResponse& futureResponse);
	GravityReturnCode setSubscriptionTimeoutMonitor(const std::string& dataProductID, const gravity::GravitySubscriptionMonitor& monitor, 
			int milliSecondTimeout, const std::string& filter="", const std::string& domain="");
	GravityReturnCode clearSubscriptionTimeoutMonitor(const std::string& dataProductID, const gravity::GravitySubscriptionMonitor& monitor, 
			const std::string& filter="", const std::string& domain="");
};

class GravityDataProduct
{
public:
    GravityDataProduct() {}
    GravityDataProduct(std::string dataProductID);
    GravityDataProduct(void* arrayPtr, int size);
    virtual ~GravityDataProduct();
    uint64_t getGravityTimestamp() const;
    uint64_t getReceivedTimestamp() const;
    std::string getDataProductID() const;
    void setSoftwareVersion(std::string softwareVersion);
    std::string getSoftwareVersion() const;
    void setData(const void* data, int size);
    void setData(const google::protobuf::Message& data);
    bool getData(void* data, int size) const;
    int getDataSize() const;
    bool populateMessage(google::protobuf::Message& data) const;
    int getSize() const;
    void parseFromArray(void* arrayPtr, int size);
    bool serializeToArray(void* arrayPtr) const;
    bool operator==(const GravityDataProduct &gdp);
	std::string getComponentId();
	std::string getDomain();
	bool isFutureResponse();
	bool isCachedDataproduct();
	void setIsCachedDataproduct(bool cached);
	std::string getFutureSocketUrl();
    void setTimestamp(uint64_t ts) const { gravityDataProductPB->set_timestamp(ts); }
    void setReceivedTimestamp(uint64_t ts) const { gravityDataProductPB->set_received_timestamp(ts); }
	void setComponentId(std::string componentId) const { gravityDataProductPB->set_componentid(componentId);}
	void setDomain(std::string domain) const { gravityDataProductPB->set_domain(domain);}
};

class GravitySubscriber {
public:
    ~GravitySubscriber();
    virtual void subscriptionFilled(const std::vector< shared_ptr<GravityDataProduct> >& dataProducts) = 0;
};
};