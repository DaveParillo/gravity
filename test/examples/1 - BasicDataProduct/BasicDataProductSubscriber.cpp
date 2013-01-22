#include <iostream>
#include <GravityNode.h>
#include <GravityLogger.h>
#include <Utility.h>

using namespace gravity;

//Declare a class for receiving Published messages.  
class SimpleGravitySubscriber : public GravitySubscriber
{
public:
	virtual void subscriptionFilled(const std::vector< shared_ptr<GravityDataProduct> >& dataProducts);
};

int main()
{
	GravityNode gn;
	const std::string dataProductID = "HelloWorldDataProduct";

	//Initialize gravity, giving this node a componentID.
	GravityReturnCode ret = gn.init("SimpleGravityComponentID2");
	if (ret != GravityReturnCodes::SUCCESS)
	{
		Log::fatal("Could not initialize GravityNode, return code is %d", ret);
		exit(1);
	}

	//Subscribe a SimpleGravityHelloWorldSubscriber to the counter.  
	SimpleGravitySubscriber hwSubscriber;
	ret = gn.subscribe(dataProductID, hwSubscriber);
	if (ret != GravityReturnCodes::SUCCESS)
	{
		Log::critical("Could not subscribe to data product with id %s, return code was %d", dataProductID.c_str(), ret);
		exit(1);
	}
		
	//Wait for us to exit (Ctrl-C or being killed).  
	gn.waitForExit();
	
	//Currently this will never be hit because we will have been killed (unfortunately).  
	//But this shouldn't make a difference because the OS should close the socket and free all resources.  
	gn.unsubscribe("HelloWorldDataProduct", hwSubscriber);
}

void SimpleGravitySubscriber::subscriptionFilled(const std::vector< shared_ptr<GravityDataProduct> >& dataProducts)
{
	for(std::vector< shared_ptr<GravityDataProduct> >::const_iterator i = dataProducts.begin();
			i != dataProducts.end(); i++)
	{
		//Get a raw message
		int size = (*i)->getDataSize();
		char* message = new char[size+1];
		(*i)->getData(message, size);
		message[size] = 0; // null terminate
		
		//Output the message
		Log::warning("Got message: %s", message);
		//Don't forget to free the memory we allocated.  
		delete message;
	}
}
