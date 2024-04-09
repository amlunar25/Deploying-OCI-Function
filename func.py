import subprocess
import json
import os

def handler(context, data):

    # Retriving context from OCI Event
    content = json.loads(data.getvalue())

    # Getting created/updated object
    object_name = content.get("data").get("resourceName")
    parent_dir = os.path.dirname(object_name)
    
    # Run rclone command to sync objects from OCI bucket to AWS S3 bucket
    rclone_command = f"rclone sync oci:StoreTest1/{object_name} s3:oci-aws-test/approach-x/{parent_dir}"
    subprocess.run(rclone_command, shell=True, check=True)

    return {"message": "Sync completed."}