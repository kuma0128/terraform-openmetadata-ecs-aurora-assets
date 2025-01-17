{
   "Version":"2012-10-17",
   "Statement":[
      {
         "Effect":"Allow",
         "Principal":{
            "Service":[
               "ecs-tasks.amazonaws.com"
            ]
         },
         "Action":"sts:AssumeRole",
         "Condition":{
            "ArnLike":{
                "aws:SourceArn":"arn:aws:ecs:${region}:${account_id}:*"
            },
            "StringEquals":{
               "aws:SourceAccount":"${account_id}"
            }
         }
      }
   ]
}