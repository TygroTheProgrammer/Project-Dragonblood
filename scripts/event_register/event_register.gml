///@description event register
///@arg event
///@arg id
///@arg script
///@arg arg1.....*

with(obj_eventmanager)
{
	var ev = argument[0];
	var objID = argument[1];
	
	if(!ds_map_exists(eventMap, ev))
	{
		//We need to add the event map
		var listenerList = ds_list_create();
		
		//add the listener info to the eventMap
		ds_map_add_list(eventMap,ev,listenerList);
	} 
	else
	{
		var listenerList = eventMap[? ev];
	}
	//Add listener info
	var listenerInfo;
	
	//Add Listener Id
	listenerInfo[0] = objID;
	//Add scripts and arguments
	var len = argument_count-2;
	var i = 0; repeat(len)
	{
		listenerInfo[i+1] = argument[i+2]
		i++;
	}
	//Add listener info to the listener list
	ds_list_add(listenerList, listenerInfo);
	
}