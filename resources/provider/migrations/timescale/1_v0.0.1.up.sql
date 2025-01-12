-- Autogenerated by migration tool on 2022-04-11 10:42:49

-- Resource: AccessBindingsByCloud
CREATE TABLE IF NOT EXISTS "yandex_access_bindings_by_cloud" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"cq_fetch_date" timestamp without time zone NOT NULL,
	"resource_id" text,
	"role_id" text,
	"subject_id" text,
	"subject_type" text,
	CONSTRAINT yandex_access_bindings_by_cloud_pk PRIMARY KEY(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,cq_id)
);
SELECT setup_tsdb_parent('yandex_access_bindings_by_cloud');

-- Resource: AccessBindingsByFolder
CREATE TABLE IF NOT EXISTS "yandex_access_bindings_by_folder" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"cq_fetch_date" timestamp without time zone NOT NULL,
	"resource_id" text,
	"role_id" text,
	"subject_id" text,
	"subject_type" text,
	CONSTRAINT yandex_access_bindings_by_folder_pk PRIMARY KEY(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,cq_id)
);
SELECT setup_tsdb_parent('yandex_access_bindings_by_folder');

-- Resource: AccessBindingsByOrganization
CREATE TABLE IF NOT EXISTS "yandex_access_bindings_by_organization" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"cq_fetch_date" timestamp without time zone NOT NULL,
	"resource_id" text,
	"role_id" text,
	"subject_id" text,
	"subject_type" text,
	CONSTRAINT yandex_access_bindings_by_organization_pk PRIMARY KEY(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,cq_id)
);
SELECT setup_tsdb_parent('yandex_access_bindings_by_organization');

-- Resource: CertificateManagerCertificates
CREATE TABLE IF NOT EXISTS "yandex_certificatemanager_certificates" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"cq_fetch_date" timestamp without time zone NOT NULL,
	"id" text NOT NULL,
	"folder_id" text,
	"created_at" timestamp without time zone,
	"name" text,
	"description" text,
	"labels" jsonb,
	"type" text,
	"domains" text[],
	"status" text,
	"issuer" text,
	"subject" text,
	"serial" text,
	"updated_at" timestamp without time zone,
	"issued_at" timestamp without time zone,
	"not_after" timestamp without time zone,
	"not_before" timestamp without time zone,
	CONSTRAINT yandex_certificatemanager_certificates_pk PRIMARY KEY(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,id)
);
SELECT setup_tsdb_parent('yandex_certificatemanager_certificates');
CREATE TABLE IF NOT EXISTS "yandex_certificatemanager_certificate_challenges" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"cq_fetch_date" timestamp without time zone NOT NULL,
	"certificate_cq_id" uuid,
	"certificate_id" text,
	"domain" text,
	"type" text,
	"created_at" timestamp without time zone,
	"updated_at" timestamp without time zone,
	"status" text,
	"message" text,
	"error" text,
	"challenge_dns_challenge_name" text,
	"challenge_dns_challenge_type" text,
	"challenge_dns_challenge_value" text,
	"challenge_http_challenge_url" text,
	"challenge_http_challenge_content" text,
	CONSTRAINT yandex_certificatemanager_certificate_challenges_pk PRIMARY KEY(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,cq_id)
);
CREATE INDEX ON yandex_certificatemanager_certificate_challenges (cq_fetch_date, certificate_cq_id);
SELECT setup_tsdb_child('yandex_certificatemanager_certificate_challenges', 'certificate_cq_id', 'yandex_certificatemanager_certificates', 'cq_id');

-- Resource: ComputeDisks
CREATE TABLE IF NOT EXISTS "yandex_compute_disks" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"cq_fetch_date" timestamp without time zone NOT NULL,
	"id" text NOT NULL,
	"folder_id" text,
	"created_at" timestamp without time zone,
	"name" text,
	"description" text,
	"labels" jsonb,
	"type_id" text,
	"zone_id" text,
	"size" bigint,
	"block_size" bigint,
	"product_ids" text[],
	"status" text,
	"source_source_image_id" text,
	"source_source_snapshot_id" text,
	"instance_ids" text[],
	"disk_placement_policy_placement_group_id" text,
	CONSTRAINT yandex_compute_disks_pk PRIMARY KEY(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,id)
);
SELECT setup_tsdb_parent('yandex_compute_disks');

-- Resource: ComputeImages
CREATE TABLE IF NOT EXISTS "yandex_compute_images" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"cq_fetch_date" timestamp without time zone NOT NULL,
	"id" text NOT NULL,
	"folder_id" text,
	"created_at" timestamp without time zone,
	"name" text,
	"description" text,
	"labels" jsonb,
	"family" text,
	"storage_size" bigint,
	"min_disk_size" bigint,
	"product_ids" text[],
	"status" text,
	"os_type" text,
	"pooled" boolean,
	CONSTRAINT yandex_compute_images_pk PRIMARY KEY(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,id)
);
SELECT setup_tsdb_parent('yandex_compute_images');

-- Resource: ComputeInstances
CREATE TABLE IF NOT EXISTS "yandex_compute_instances" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"cq_fetch_date" timestamp without time zone NOT NULL,
	"id" text NOT NULL,
	"folder_id" text,
	"created_at" timestamp without time zone,
	"name" text,
	"description" text,
	"labels" jsonb,
	"zone_id" text,
	"platform_id" text,
	"resources_memory" bigint,
	"resources_cores" bigint,
	"resources_core_fraction" bigint,
	"resources_gpus" bigint,
	"status" text,
	"metadata" jsonb,
	"boot_disk_mode" text,
	"boot_disk_device_name" text,
	"boot_disk_auto_delete" boolean,
	"boot_disk_disk_id" text,
	"fqdn" text,
	"scheduling_policy_preemptible" boolean,
	"service_account_id" text,
	"network_settings_type" text,
	"placement_policy_placement_group_id" text,
	CONSTRAINT yandex_compute_instances_pk PRIMARY KEY(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,id)
);
SELECT setup_tsdb_parent('yandex_compute_instances');
CREATE TABLE IF NOT EXISTS "yandex_compute_instance_secondary_disks" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"cq_fetch_date" timestamp without time zone NOT NULL,
	"instance_cq_id" uuid,
	"instance_id" text,
	"mode" text,
	"device_name" text,
	"auto_delete" boolean,
	"disk_id" text,
	CONSTRAINT yandex_compute_instance_secondary_disks_pk PRIMARY KEY(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,cq_id)
);
CREATE INDEX ON yandex_compute_instance_secondary_disks (cq_fetch_date, instance_cq_id);
SELECT setup_tsdb_child('yandex_compute_instance_secondary_disks', 'instance_cq_id', 'yandex_compute_instances', 'cq_id');
CREATE TABLE IF NOT EXISTS "yandex_compute_instance_local_disks" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"cq_fetch_date" timestamp without time zone NOT NULL,
	"instance_cq_id" uuid,
	"instance_id" text,
	"size" bigint,
	"device_name" text,
	CONSTRAINT yandex_compute_instance_local_disks_pk PRIMARY KEY(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,cq_id)
);
CREATE INDEX ON yandex_compute_instance_local_disks (cq_fetch_date, instance_cq_id);
SELECT setup_tsdb_child('yandex_compute_instance_local_disks', 'instance_cq_id', 'yandex_compute_instances', 'cq_id');
CREATE TABLE IF NOT EXISTS "yandex_compute_instance_filesystems" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"cq_fetch_date" timestamp without time zone NOT NULL,
	"instance_cq_id" uuid,
	"instance_id" text,
	"mode" text,
	"device_name" text,
	"filesystem_id" text,
	CONSTRAINT yandex_compute_instance_filesystems_pk PRIMARY KEY(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,cq_id)
);
CREATE INDEX ON yandex_compute_instance_filesystems (cq_fetch_date, instance_cq_id);
SELECT setup_tsdb_child('yandex_compute_instance_filesystems', 'instance_cq_id', 'yandex_compute_instances', 'cq_id');
CREATE TABLE IF NOT EXISTS "yandex_compute_instance_network_interfaces" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"cq_fetch_date" timestamp without time zone NOT NULL,
	"instance_cq_id" uuid,
	"instance_id" text,
	"index" text,
	"mac_address" text,
	"subnet_id" text,
	"primary_v_4_address_address" text,
	"primary_v_4_address_one_to_one_nat_address" text,
	"primary_v_4_address_one_to_one_nat_ip_version" text,
	"primary_v_6_address_address" text,
	"primary_v_6_address_one_to_one_nat_address" text,
	"primary_v_6_address_one_to_one_nat_ip_version" text,
	"security_group_ids" text[],
	CONSTRAINT yandex_compute_instance_network_interfaces_pk PRIMARY KEY(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,cq_id)
);
CREATE INDEX ON yandex_compute_instance_network_interfaces (cq_fetch_date, instance_cq_id);
SELECT setup_tsdb_child('yandex_compute_instance_network_interfaces', 'instance_cq_id', 'yandex_compute_instances', 'cq_id');
CREATE TABLE IF NOT EXISTS "yandex_compute_instance_net_interface_ipv4_1_1_nat_dns_records" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"cq_fetch_date" timestamp without time zone NOT NULL,
	"network_interfaces_cq_id" uuid,
	"fqdn" text,
	"dns_zone_id" text,
	"ttl" bigint,
	"ptr" boolean,
	CONSTRAINT yandex_compute_instance_net_interface_ipv4_1_1_nat_dns_recor_pk PRIMARY KEY(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,cq_id)
);
CREATE INDEX ON yandex_compute_instance_net_interface_ipv4_1_1_nat_dns_records (cq_fetch_date, network_interfaces_cq_id);
SELECT setup_tsdb_child('yandex_compute_instance_net_interface_ipv4_1_1_nat_dns_records', 'network_interfaces_cq_id', 'yandex_compute_instance_network_interfaces', 'cq_id');
CREATE TABLE IF NOT EXISTS "yandex_compute_instance_net_interface_ipv4_dns_records" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"cq_fetch_date" timestamp without time zone NOT NULL,
	"network_interfaces_cq_id" uuid,
	"fqdn" text,
	"dns_zone_id" text,
	"ttl" bigint,
	"ptr" boolean,
	CONSTRAINT yandex_compute_instance_net_interface_ipv4_dns_records_pk PRIMARY KEY(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,cq_id)
);
CREATE INDEX ON yandex_compute_instance_net_interface_ipv4_dns_records (cq_fetch_date, network_interfaces_cq_id);
SELECT setup_tsdb_child('yandex_compute_instance_net_interface_ipv4_dns_records', 'network_interfaces_cq_id', 'yandex_compute_instance_network_interfaces', 'cq_id');
CREATE TABLE IF NOT EXISTS "yandex_compute_instance_net_interface_ipv6_1_1_nat_dns_records" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"cq_fetch_date" timestamp without time zone NOT NULL,
	"network_interfaces_cq_id" uuid,
	"fqdn" text,
	"dns_zone_id" text,
	"ttl" bigint,
	"ptr" boolean,
	CONSTRAINT yandex_compute_instance_net_interface_ipv6_1_1_nat_dns_recor_pk PRIMARY KEY(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,cq_id)
);
CREATE INDEX ON yandex_compute_instance_net_interface_ipv6_1_1_nat_dns_records (cq_fetch_date, network_interfaces_cq_id);
SELECT setup_tsdb_child('yandex_compute_instance_net_interface_ipv6_1_1_nat_dns_records', 'network_interfaces_cq_id', 'yandex_compute_instance_network_interfaces', 'cq_id');
CREATE TABLE IF NOT EXISTS "yandex_compute_instance_net_interface_ipv6_dns_records" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"cq_fetch_date" timestamp without time zone NOT NULL,
	"network_interfaces_cq_id" uuid,
	"fqdn" text,
	"dns_zone_id" text,
	"ttl" bigint,
	"ptr" boolean,
	CONSTRAINT yandex_compute_instance_net_interface_ipv6_dns_records_pk PRIMARY KEY(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,cq_id)
);
CREATE INDEX ON yandex_compute_instance_net_interface_ipv6_dns_records (cq_fetch_date, network_interfaces_cq_id);
SELECT setup_tsdb_child('yandex_compute_instance_net_interface_ipv6_dns_records', 'network_interfaces_cq_id', 'yandex_compute_instance_network_interfaces', 'cq_id');
CREATE TABLE IF NOT EXISTS "yandex_compute_instance_placement_policy_host_affinity_rules" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"cq_fetch_date" timestamp without time zone NOT NULL,
	"instance_cq_id" uuid,
	"instance_id" text,
	"key" text,
	"op" text,
	"values" text[],
	CONSTRAINT yandex_compute_instance_placement_policy_host_affinity_rules_pk PRIMARY KEY(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,cq_id)
);
CREATE INDEX ON yandex_compute_instance_placement_policy_host_affinity_rules (cq_fetch_date, instance_cq_id);
SELECT setup_tsdb_child('yandex_compute_instance_placement_policy_host_affinity_rules', 'instance_cq_id', 'yandex_compute_instances', 'cq_id');

-- Resource: IAMServiceAccounts
CREATE TABLE IF NOT EXISTS "yandex_iam_service_accounts" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"cq_fetch_date" timestamp without time zone NOT NULL,
	"id" text NOT NULL,
	"folder_id" text,
	"created_at" timestamp without time zone,
	"name" text,
	"description" text,
	"labels" jsonb,
	CONSTRAINT yandex_iam_service_accounts_pk PRIMARY KEY(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,id)
);
SELECT setup_tsdb_parent('yandex_iam_service_accounts');

-- Resource: IAMUserAccountsByCloud
CREATE TABLE IF NOT EXISTS "yandex_iam_user_accounts_by_cloud" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"cq_fetch_date" timestamp without time zone NOT NULL,
	"id" text NOT NULL,
	"cloud_id" text,
	"user_account_yandex_passport_user_account_login" text,
	"user_account_yandex_passport_user_account_default_email" text,
	"user_account_saml_user_account_federation_id" text,
	"user_account_saml_user_account_name_id" text,
	"user_account_saml_user_account_attributes" jsonb,
	CONSTRAINT yandex_iam_user_accounts_by_cloud_pk PRIMARY KEY(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,id)
);
SELECT setup_tsdb_parent('yandex_iam_user_accounts_by_cloud');

-- Resource: IAMUserAccountsByFolder
CREATE TABLE IF NOT EXISTS "yandex_iam_user_accounts_by_folder" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"cq_fetch_date" timestamp without time zone NOT NULL,
	"id" text NOT NULL,
	"folder_id" text,
	"user_account_yandex_passport_user_account_login" text,
	"user_account_yandex_passport_user_account_default_email" text,
	"user_account_saml_user_account_federation_id" text,
	"user_account_saml_user_account_name_id" text,
	"user_account_saml_user_account_attributes" jsonb,
	CONSTRAINT yandex_iam_user_accounts_by_folder_pk PRIMARY KEY(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,id)
);
SELECT setup_tsdb_parent('yandex_iam_user_accounts_by_folder');

-- Resource: IAMUserAccountsByOrganization
CREATE TABLE IF NOT EXISTS "yandex_iam_user_accounts_by_organization" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"cq_fetch_date" timestamp without time zone NOT NULL,
	"id" text NOT NULL,
	"organization_id" text,
	"user_account_yandex_passport_user_account_login" text,
	"user_account_yandex_passport_user_account_default_email" text,
	"user_account_saml_user_account_federation_id" text,
	"user_account_saml_user_account_name_id" text,
	"user_account_saml_user_account_attributes" jsonb,
	CONSTRAINT yandex_iam_user_accounts_by_organization_pk PRIMARY KEY(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,id)
);
SELECT setup_tsdb_parent('yandex_iam_user_accounts_by_organization');

-- Resource: K8SClusters
CREATE TABLE IF NOT EXISTS "yandex_k8s_clusters" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"cq_fetch_date" timestamp without time zone NOT NULL,
	"id" text NOT NULL,
	"folder_id" text,
	"created_at" timestamp without time zone,
	"name" text,
	"description" text,
	"labels" jsonb,
	"status" text,
	"health" text,
	"network_id" text,
	"master_master_type_zonal_master_zone_id" text,
	"master_master_type_zonal_master_internal_v_4_address" text,
	"master_master_type_zonal_master_external_v_4_address" text,
	"master_master_type_regional_master_region_id" text,
	"master_master_type_regional_master_internal_v_4_address" text,
	"master_master_type_regional_master_external_v_4_address" text,
	"master_version" text,
	"master_endpoints_internal_v_4_endpoint" text,
	"master_endpoints_external_v_4_endpoint" text,
	"master_master_auth_cluster_ca_certificate" text,
	"master_version_info_current_version" text,
	"master_version_info_new_revision_available" boolean,
	"master_version_info_new_revision_summary" text,
	"master_version_info_version_deprecated" boolean,
	"master_security_group_ids" text[],
	"ip_allocation_policy_cluster_ipv_4_cidr_block" text,
	"ip_allocation_policy_node_ipv_4_cidr_mask_size" bigint,
	"ip_allocation_policy_service_ipv_4_cidr_block" text,
	"ip_allocation_policy_cluster_ipv_6_cidr_block" text,
	"ip_allocation_policy_service_ipv_6_cidr_block" text,
	"internet_gateway_gateway_ipv_4_address" text,
	"service_account_id" text,
	"node_service_account_id" text,
	"release_channel" text,
	"network_policy_provider" text,
	"kms_provider_key_id" text,
	"log_group_id" text,
	"network_implementation_cilium_routing_mode" text,
	CONSTRAINT yandex_k8s_clusters_pk PRIMARY KEY(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,id)
);
SELECT setup_tsdb_parent('yandex_k8s_clusters');

-- Resource: KMSSymmetricKeys
CREATE TABLE IF NOT EXISTS "yandex_kms_symmetric_keys" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"cq_fetch_date" timestamp without time zone NOT NULL,
	"id" text NOT NULL,
	"folder_id" text,
	"created_at" timestamp without time zone,
	"name" text,
	"description" text,
	"labels" jsonb,
	"status" text,
	"primary_version_id" text,
	"primary_version_key_id" text,
	"primary_version_status" text,
	"primary_version_algorithm" text,
	"primary_version_created_at" timestamp without time zone,
	"primary_version_primary" boolean,
	"primary_version_destroy_at" timestamp without time zone,
	"primary_version_hosted_by_hsm" boolean,
	"default_algorithm" text,
	"rotated_at" timestamp without time zone,
	"rotation_period_seconds" bigint,
	"rotation_period_nanos" integer,
	"deletion_protection" boolean,
	CONSTRAINT yandex_kms_symmetric_keys_pk PRIMARY KEY(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,id)
);
SELECT setup_tsdb_parent('yandex_kms_symmetric_keys');

-- Resource: ObjectStorageBuckets
CREATE TABLE IF NOT EXISTS "yandex_object_storage_buckets" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"cq_fetch_date" timestamp without time zone NOT NULL,
	"id" text NOT NULL,
	CONSTRAINT yandex_object_storage_buckets_pk PRIMARY KEY(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,id)
);
SELECT setup_tsdb_parent('yandex_object_storage_buckets');
CREATE TABLE IF NOT EXISTS "yandex_object_bucket_serv_side_encrypt_config_rules" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"cq_fetch_date" timestamp without time zone NOT NULL,
	"storage_id" text,
	"bucket_key_enabled" boolean,
	"apply_server_side_encryption_by_default_kms_master_key_id" text,
	"apply_server_side_encryption_by_default_sse_algorithm " text,
	CONSTRAINT yandex_object_bucket_serv_side_encrypt_config_rules_pk PRIMARY KEY(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,cq_id)
);
SELECT setup_tsdb_parent('yandex_object_bucket_serv_side_encrypt_config_rules');

-- Resource: ResourceManagerClouds
CREATE TABLE IF NOT EXISTS "yandex_resourcemanager_clouds" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"cq_fetch_date" timestamp without time zone NOT NULL,
	"id" text NOT NULL,
	"created_at" timestamp without time zone,
	"name" text,
	"description" text,
	"organization_id" text,
	CONSTRAINT yandex_resourcemanager_clouds_pk PRIMARY KEY(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,id)
);
SELECT setup_tsdb_parent('yandex_resourcemanager_clouds');

-- Resource: ResourceManagerFolders
CREATE TABLE IF NOT EXISTS "yandex_resourcemanager_folders" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"cq_fetch_date" timestamp without time zone NOT NULL,
	"id" text NOT NULL,
	"created_at" timestamp without time zone,
	"name" text,
	"description" text,
	"organization_id" text,
	CONSTRAINT yandex_resourcemanager_folders_pk PRIMARY KEY(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,id)
);
SELECT setup_tsdb_parent('yandex_resourcemanager_folders');

-- Resource: ServerlessApiGateways
CREATE TABLE IF NOT EXISTS "yandex_serverless_api_gateways" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"cq_fetch_date" timestamp without time zone NOT NULL,
	"id" text NOT NULL,
	"folder_id" text,
	"created_at" timestamp without time zone,
	"name" text,
	"description" text,
	"labels" jsonb,
	"status" text,
	"domain" text,
	"log_group_id" text,
	"connectivity_network_id" text,
	"connectivity_subnet_id" text[],
	CONSTRAINT yandex_serverless_api_gateways_pk PRIMARY KEY(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,id)
);
SELECT setup_tsdb_parent('yandex_serverless_api_gateways');
CREATE TABLE IF NOT EXISTS "yandex_apigateway_api_gateway_attached_domains" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"cq_fetch_date" timestamp without time zone NOT NULL,
	"api_gateway_cq_id" uuid,
	"api_gateway_id" text,
	"domain_id" text,
	"certificate_id" text,
	"enabled" boolean,
	"domain" text,
	CONSTRAINT yandex_apigateway_api_gateway_attached_domains_pk PRIMARY KEY(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,cq_id)
);
CREATE INDEX ON yandex_apigateway_api_gateway_attached_domains (cq_fetch_date, api_gateway_cq_id);
SELECT setup_tsdb_child('yandex_apigateway_api_gateway_attached_domains', 'api_gateway_cq_id', 'yandex_serverless_api_gateways', 'cq_id');

-- Resource: VPCAddresses
CREATE TABLE IF NOT EXISTS "yandex_vpc_addresses" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"cq_fetch_date" timestamp without time zone NOT NULL,
	"id" text NOT NULL,
	"folder_id" text,
	"created_at" timestamp without time zone,
	"name" text,
	"description" text,
	"labels" jsonb,
	"address_external_ipv_4_address_address" text,
	"address_external_ipv_4_address_zone_id" text,
	"addr_ext_ipv_4_addr_requirements_ddos_protect_prov" text,
	"addr_ext_ipv_4_addr_requirements_out_smtp_cap" text,
	"reserved" boolean,
	"used" boolean,
	"type" text,
	"ip_version" text,
	CONSTRAINT yandex_vpc_addresses_pk PRIMARY KEY(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,id)
);
SELECT setup_tsdb_parent('yandex_vpc_addresses');

-- Resource: VPCNetworks
CREATE TABLE IF NOT EXISTS "yandex_vpc_networks" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"cq_fetch_date" timestamp without time zone NOT NULL,
	"id" text NOT NULL,
	"folder_id" text,
	"created_at" timestamp without time zone,
	"name" text,
	"description" text,
	"labels" jsonb,
	"default_security_group_id" text,
	CONSTRAINT yandex_vpc_networks_pk PRIMARY KEY(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,id)
);
SELECT setup_tsdb_parent('yandex_vpc_networks');

-- Resource: VPCSecurityGroups
CREATE TABLE IF NOT EXISTS "yandex_vpc_security_groups" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"cq_fetch_date" timestamp without time zone NOT NULL,
	"id" text NOT NULL,
	"folder_id" text,
	"created_at" timestamp without time zone,
	"name" text,
	"description" text,
	"labels" jsonb,
	"network_id" text,
	"status" text,
	"default_for_network" boolean,
	CONSTRAINT yandex_vpc_security_groups_pk PRIMARY KEY(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,id)
);
SELECT setup_tsdb_parent('yandex_vpc_security_groups');
CREATE TABLE IF NOT EXISTS "yandex_vpc_security_group_rules" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"cq_fetch_date" timestamp without time zone NOT NULL,
	"security_group_cq_id" uuid,
	"security_group_id" text,
	"id" text NOT NULL,
	"description" text,
	"labels" jsonb,
	"direction" text,
	"ports_from_port" bigint,
	"ports_to_port" bigint,
	"protocol_name" text,
	"protocol_number" bigint,
	"target_cidr_blocks_v_4_cidr_blocks" text[],
	"target_cidr_blocks_v_6_cidr_blocks" text[],
	"target_security_group_id" text,
	"target_predefined_target" text,
	CONSTRAINT yandex_vpc_security_group_rules_pk PRIMARY KEY(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,id)
);
CREATE INDEX ON yandex_vpc_security_group_rules (cq_fetch_date, security_group_cq_id);
SELECT setup_tsdb_child('yandex_vpc_security_group_rules', 'security_group_cq_id', 'yandex_vpc_security_groups', 'cq_id');

-- Resource: VPCSubnets
CREATE TABLE IF NOT EXISTS "yandex_vpc_subnets" (
	"cq_id" uuid NOT NULL,
	"cq_meta" jsonb,
	"cq_fetch_date" timestamp without time zone NOT NULL,
	"id" text NOT NULL,
	"folder_id" text,
	"created_at" timestamp without time zone,
	"name" text,
	"description" text,
	"labels" jsonb,
	"network_id" text,
	"zone_id" text,
	"v_4_cidr_blocks" text[],
	"v_6_cidr_blocks" text[],
	"route_table_id" text,
	"dhcp_options_domain_name_servers" text[],
	"dhcp_options_domain_name" text,
	"dhcp_options_ntp_servers" text[],
	CONSTRAINT yandex_vpc_subnets_pk PRIMARY KEY(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,cq_id),
	UNIQUE(cq_fetch_date,id)
);
SELECT setup_tsdb_parent('yandex_vpc_subnets');
