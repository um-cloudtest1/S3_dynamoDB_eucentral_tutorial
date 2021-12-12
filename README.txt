https://www.salto.io/blog/tutorial-getting-started-with-terraform
The objective is to create an EC2 instance with the backend state saved in a DynamoDB database stored in an S3 bucket. 
Kevin suggested an alternative as https://github.com/miquella/vaulted but this method is more cloud-oriented.
However, I needed to make some changes:  
1.  Because names including "tfstate" are global, I changed all instances of "tfstate" to "umcs" in all .tf files in the state/ subfolder.
2.  I changed the version of terraform to 1.0.9.
Note that changed lines have an appended comment "# changed".

However, I left the region as eu-central-1.  I changed the region and made other changes in the folder ../S3_dynamoDB_uswest_tutorial/

https://aws.amazon.com/free/?all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Types=*all&awsf.Free%20Tier%20Categories=*all  # lists DynamoDB 25 GB as a free tier service
