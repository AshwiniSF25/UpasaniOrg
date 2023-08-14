trigger UserTriggerEvent on User  (after update, before update) 
{
    if(Trigger.isBefore)
    {
        Users.processBefore(Trigger.new);
    }

}