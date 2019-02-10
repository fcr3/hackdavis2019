// NOTE: This file was generated by the ServiceGenerator.

// ----------------------------------------------------------------------------
// API:
//   Cloud Vision API (vision/v1)
// Description:
//   Integrates Google Vision features, including image labeling, face, logo,
//   and landmark detection, optical character recognition (OCR), and detection
//   of explicit content, into applications.
// Documentation:
//   https://cloud.google.com/vision/

#import "GTLRVisionQuery.h"

#import "GTLRVisionObjects.h"

@implementation GTLRVisionQuery

@dynamic fields;

@end

@implementation GTLRVisionQuery_FilesAsyncBatchAnnotate

+ (instancetype)queryWithObject:(GTLRVision_AsyncBatchAnnotateFilesRequest *)object {
  if (object == nil) {
    GTLR_DEBUG_ASSERT(object != nil, @"Got a nil object");
    return nil;
  }
  NSString *pathURITemplate = @"v1/files:asyncBatchAnnotate";
  GTLRVisionQuery_FilesAsyncBatchAnnotate *query =
    [[self alloc] initWithPathURITemplate:pathURITemplate
                               HTTPMethod:@"POST"
                       pathParameterNames:nil];
  query.bodyObject = object;
  query.expectedObjectClass = [GTLRVision_Operation class];
  query.loggingName = @"vision.files.asyncBatchAnnotate";
  return query;
}

@end

@implementation GTLRVisionQuery_ImagesAnnotate

+ (instancetype)queryWithObject:(GTLRVision_BatchAnnotateImagesRequest *)object {
  if (object == nil) {
    GTLR_DEBUG_ASSERT(object != nil, @"Got a nil object");
    return nil;
  }
  NSString *pathURITemplate = @"v1/images:annotate";
  GTLRVisionQuery_ImagesAnnotate *query =
    [[self alloc] initWithPathURITemplate:pathURITemplate
                               HTTPMethod:@"POST"
                       pathParameterNames:nil];
  query.bodyObject = object;
  query.expectedObjectClass = [GTLRVision_BatchAnnotateImagesResponse class];
  query.loggingName = @"vision.images.annotate";
  return query;
}

@end

@implementation GTLRVisionQuery_LocationsOperationsGet

@dynamic name;

+ (instancetype)queryWithName:(NSString *)name {
  NSArray *pathParams = @[ @"name" ];
  NSString *pathURITemplate = @"v1/{+name}";
  GTLRVisionQuery_LocationsOperationsGet *query =
    [[self alloc] initWithPathURITemplate:pathURITemplate
                               HTTPMethod:nil
                       pathParameterNames:pathParams];
  query.name = name;
  query.expectedObjectClass = [GTLRVision_Operation class];
  query.loggingName = @"vision.locations.operations.get";
  return query;
}

@end

@implementation GTLRVisionQuery_OperationsCancel

@dynamic name;

+ (instancetype)queryWithObject:(GTLRVision_CancelOperationRequest *)object
                           name:(NSString *)name {
  if (object == nil) {
    GTLR_DEBUG_ASSERT(object != nil, @"Got a nil object");
    return nil;
  }
  NSArray *pathParams = @[ @"name" ];
  NSString *pathURITemplate = @"v1/{+name}:cancel";
  GTLRVisionQuery_OperationsCancel *query =
    [[self alloc] initWithPathURITemplate:pathURITemplate
                               HTTPMethod:@"POST"
                       pathParameterNames:pathParams];
  query.bodyObject = object;
  query.name = name;
  query.expectedObjectClass = [GTLRVision_Empty class];
  query.loggingName = @"vision.operations.cancel";
  return query;
}

@end

@implementation GTLRVisionQuery_OperationsDelete

@dynamic name;

+ (instancetype)queryWithName:(NSString *)name {
  NSArray *pathParams = @[ @"name" ];
  NSString *pathURITemplate = @"v1/{+name}";
  GTLRVisionQuery_OperationsDelete *query =
    [[self alloc] initWithPathURITemplate:pathURITemplate
                               HTTPMethod:@"DELETE"
                       pathParameterNames:pathParams];
  query.name = name;
  query.expectedObjectClass = [GTLRVision_Empty class];
  query.loggingName = @"vision.operations.delete";
  return query;
}

@end

@implementation GTLRVisionQuery_OperationsGet

@dynamic name;

+ (instancetype)queryWithName:(NSString *)name {
  NSArray *pathParams = @[ @"name" ];
  NSString *pathURITemplate = @"v1/{+name}";
  GTLRVisionQuery_OperationsGet *query =
    [[self alloc] initWithPathURITemplate:pathURITemplate
                               HTTPMethod:nil
                       pathParameterNames:pathParams];
  query.name = name;
  query.expectedObjectClass = [GTLRVision_Operation class];
  query.loggingName = @"vision.operations.get";
  return query;
}

@end

@implementation GTLRVisionQuery_OperationsList

@dynamic filter, name, pageSize, pageToken;

+ (instancetype)queryWithName:(NSString *)name {
  NSArray *pathParams = @[ @"name" ];
  NSString *pathURITemplate = @"v1/{+name}";
  GTLRVisionQuery_OperationsList *query =
    [[self alloc] initWithPathURITemplate:pathURITemplate
                               HTTPMethod:nil
                       pathParameterNames:pathParams];
  query.name = name;
  query.expectedObjectClass = [GTLRVision_ListOperationsResponse class];
  query.loggingName = @"vision.operations.list";
  return query;
}

@end

@implementation GTLRVisionQuery_ProjectsLocationsProductsCreate

@dynamic parent, productId;

+ (instancetype)queryWithObject:(GTLRVision_Product *)object
                         parent:(NSString *)parent {
  if (object == nil) {
    GTLR_DEBUG_ASSERT(object != nil, @"Got a nil object");
    return nil;
  }
  NSArray *pathParams = @[ @"parent" ];
  NSString *pathURITemplate = @"v1/{+parent}/products";
  GTLRVisionQuery_ProjectsLocationsProductsCreate *query =
    [[self alloc] initWithPathURITemplate:pathURITemplate
                               HTTPMethod:@"POST"
                       pathParameterNames:pathParams];
  query.bodyObject = object;
  query.parent = parent;
  query.expectedObjectClass = [GTLRVision_Product class];
  query.loggingName = @"vision.projects.locations.products.create";
  return query;
}

@end

@implementation GTLRVisionQuery_ProjectsLocationsProductsDelete

@dynamic name;

+ (instancetype)queryWithName:(NSString *)name {
  NSArray *pathParams = @[ @"name" ];
  NSString *pathURITemplate = @"v1/{+name}";
  GTLRVisionQuery_ProjectsLocationsProductsDelete *query =
    [[self alloc] initWithPathURITemplate:pathURITemplate
                               HTTPMethod:@"DELETE"
                       pathParameterNames:pathParams];
  query.name = name;
  query.expectedObjectClass = [GTLRVision_Empty class];
  query.loggingName = @"vision.projects.locations.products.delete";
  return query;
}

@end

@implementation GTLRVisionQuery_ProjectsLocationsProductSetsAddProduct

@dynamic name;

+ (instancetype)queryWithObject:(GTLRVision_AddProductToProductSetRequest *)object
                           name:(NSString *)name {
  if (object == nil) {
    GTLR_DEBUG_ASSERT(object != nil, @"Got a nil object");
    return nil;
  }
  NSArray *pathParams = @[ @"name" ];
  NSString *pathURITemplate = @"v1/{+name}:addProduct";
  GTLRVisionQuery_ProjectsLocationsProductSetsAddProduct *query =
    [[self alloc] initWithPathURITemplate:pathURITemplate
                               HTTPMethod:@"POST"
                       pathParameterNames:pathParams];
  query.bodyObject = object;
  query.name = name;
  query.expectedObjectClass = [GTLRVision_Empty class];
  query.loggingName = @"vision.projects.locations.productSets.addProduct";
  return query;
}

@end

@implementation GTLRVisionQuery_ProjectsLocationsProductSetsCreate

@dynamic parent, productSetId;

+ (instancetype)queryWithObject:(GTLRVision_ProductSet *)object
                         parent:(NSString *)parent {
  if (object == nil) {
    GTLR_DEBUG_ASSERT(object != nil, @"Got a nil object");
    return nil;
  }
  NSArray *pathParams = @[ @"parent" ];
  NSString *pathURITemplate = @"v1/{+parent}/productSets";
  GTLRVisionQuery_ProjectsLocationsProductSetsCreate *query =
    [[self alloc] initWithPathURITemplate:pathURITemplate
                               HTTPMethod:@"POST"
                       pathParameterNames:pathParams];
  query.bodyObject = object;
  query.parent = parent;
  query.expectedObjectClass = [GTLRVision_ProductSet class];
  query.loggingName = @"vision.projects.locations.productSets.create";
  return query;
}

@end

@implementation GTLRVisionQuery_ProjectsLocationsProductSetsDelete

@dynamic name;

+ (instancetype)queryWithName:(NSString *)name {
  NSArray *pathParams = @[ @"name" ];
  NSString *pathURITemplate = @"v1/{+name}";
  GTLRVisionQuery_ProjectsLocationsProductSetsDelete *query =
    [[self alloc] initWithPathURITemplate:pathURITemplate
                               HTTPMethod:@"DELETE"
                       pathParameterNames:pathParams];
  query.name = name;
  query.expectedObjectClass = [GTLRVision_Empty class];
  query.loggingName = @"vision.projects.locations.productSets.delete";
  return query;
}

@end

@implementation GTLRVisionQuery_ProjectsLocationsProductSetsGet

@dynamic name;

+ (instancetype)queryWithName:(NSString *)name {
  NSArray *pathParams = @[ @"name" ];
  NSString *pathURITemplate = @"v1/{+name}";
  GTLRVisionQuery_ProjectsLocationsProductSetsGet *query =
    [[self alloc] initWithPathURITemplate:pathURITemplate
                               HTTPMethod:nil
                       pathParameterNames:pathParams];
  query.name = name;
  query.expectedObjectClass = [GTLRVision_ProductSet class];
  query.loggingName = @"vision.projects.locations.productSets.get";
  return query;
}

@end

@implementation GTLRVisionQuery_ProjectsLocationsProductSetsImport

@dynamic parent;

+ (instancetype)queryWithObject:(GTLRVision_ImportProductSetsRequest *)object
                         parent:(NSString *)parent {
  if (object == nil) {
    GTLR_DEBUG_ASSERT(object != nil, @"Got a nil object");
    return nil;
  }
  NSArray *pathParams = @[ @"parent" ];
  NSString *pathURITemplate = @"v1/{+parent}/productSets:import";
  GTLRVisionQuery_ProjectsLocationsProductSetsImport *query =
    [[self alloc] initWithPathURITemplate:pathURITemplate
                               HTTPMethod:@"POST"
                       pathParameterNames:pathParams];
  query.bodyObject = object;
  query.parent = parent;
  query.expectedObjectClass = [GTLRVision_Operation class];
  query.loggingName = @"vision.projects.locations.productSets.import";
  return query;
}

@end

@implementation GTLRVisionQuery_ProjectsLocationsProductSetsList

@dynamic pageSize, pageToken, parent;

+ (instancetype)queryWithParent:(NSString *)parent {
  NSArray *pathParams = @[ @"parent" ];
  NSString *pathURITemplate = @"v1/{+parent}/productSets";
  GTLRVisionQuery_ProjectsLocationsProductSetsList *query =
    [[self alloc] initWithPathURITemplate:pathURITemplate
                               HTTPMethod:nil
                       pathParameterNames:pathParams];
  query.parent = parent;
  query.expectedObjectClass = [GTLRVision_ListProductSetsResponse class];
  query.loggingName = @"vision.projects.locations.productSets.list";
  return query;
}

@end

@implementation GTLRVisionQuery_ProjectsLocationsProductSetsPatch

@dynamic name, updateMask;

+ (instancetype)queryWithObject:(GTLRVision_ProductSet *)object
                           name:(NSString *)name {
  if (object == nil) {
    GTLR_DEBUG_ASSERT(object != nil, @"Got a nil object");
    return nil;
  }
  NSArray *pathParams = @[ @"name" ];
  NSString *pathURITemplate = @"v1/{+name}";
  GTLRVisionQuery_ProjectsLocationsProductSetsPatch *query =
    [[self alloc] initWithPathURITemplate:pathURITemplate
                               HTTPMethod:@"PATCH"
                       pathParameterNames:pathParams];
  query.bodyObject = object;
  query.name = name;
  query.expectedObjectClass = [GTLRVision_ProductSet class];
  query.loggingName = @"vision.projects.locations.productSets.patch";
  return query;
}

@end

@implementation GTLRVisionQuery_ProjectsLocationsProductSetsProductsList

@dynamic name, pageSize, pageToken;

+ (instancetype)queryWithName:(NSString *)name {
  NSArray *pathParams = @[ @"name" ];
  NSString *pathURITemplate = @"v1/{+name}/products";
  GTLRVisionQuery_ProjectsLocationsProductSetsProductsList *query =
    [[self alloc] initWithPathURITemplate:pathURITemplate
                               HTTPMethod:nil
                       pathParameterNames:pathParams];
  query.name = name;
  query.expectedObjectClass = [GTLRVision_ListProductsInProductSetResponse class];
  query.loggingName = @"vision.projects.locations.productSets.products.list";
  return query;
}

@end

@implementation GTLRVisionQuery_ProjectsLocationsProductSetsRemoveProduct

@dynamic name;

+ (instancetype)queryWithObject:(GTLRVision_RemoveProductFromProductSetRequest *)object
                           name:(NSString *)name {
  if (object == nil) {
    GTLR_DEBUG_ASSERT(object != nil, @"Got a nil object");
    return nil;
  }
  NSArray *pathParams = @[ @"name" ];
  NSString *pathURITemplate = @"v1/{+name}:removeProduct";
  GTLRVisionQuery_ProjectsLocationsProductSetsRemoveProduct *query =
    [[self alloc] initWithPathURITemplate:pathURITemplate
                               HTTPMethod:@"POST"
                       pathParameterNames:pathParams];
  query.bodyObject = object;
  query.name = name;
  query.expectedObjectClass = [GTLRVision_Empty class];
  query.loggingName = @"vision.projects.locations.productSets.removeProduct";
  return query;
}

@end

@implementation GTLRVisionQuery_ProjectsLocationsProductsGet

@dynamic name;

+ (instancetype)queryWithName:(NSString *)name {
  NSArray *pathParams = @[ @"name" ];
  NSString *pathURITemplate = @"v1/{+name}";
  GTLRVisionQuery_ProjectsLocationsProductsGet *query =
    [[self alloc] initWithPathURITemplate:pathURITemplate
                               HTTPMethod:nil
                       pathParameterNames:pathParams];
  query.name = name;
  query.expectedObjectClass = [GTLRVision_Product class];
  query.loggingName = @"vision.projects.locations.products.get";
  return query;
}

@end

@implementation GTLRVisionQuery_ProjectsLocationsProductsList

@dynamic pageSize, pageToken, parent;

+ (instancetype)queryWithParent:(NSString *)parent {
  NSArray *pathParams = @[ @"parent" ];
  NSString *pathURITemplate = @"v1/{+parent}/products";
  GTLRVisionQuery_ProjectsLocationsProductsList *query =
    [[self alloc] initWithPathURITemplate:pathURITemplate
                               HTTPMethod:nil
                       pathParameterNames:pathParams];
  query.parent = parent;
  query.expectedObjectClass = [GTLRVision_ListProductsResponse class];
  query.loggingName = @"vision.projects.locations.products.list";
  return query;
}

@end

@implementation GTLRVisionQuery_ProjectsLocationsProductsPatch

@dynamic name, updateMask;

+ (instancetype)queryWithObject:(GTLRVision_Product *)object
                           name:(NSString *)name {
  if (object == nil) {
    GTLR_DEBUG_ASSERT(object != nil, @"Got a nil object");
    return nil;
  }
  NSArray *pathParams = @[ @"name" ];
  NSString *pathURITemplate = @"v1/{+name}";
  GTLRVisionQuery_ProjectsLocationsProductsPatch *query =
    [[self alloc] initWithPathURITemplate:pathURITemplate
                               HTTPMethod:@"PATCH"
                       pathParameterNames:pathParams];
  query.bodyObject = object;
  query.name = name;
  query.expectedObjectClass = [GTLRVision_Product class];
  query.loggingName = @"vision.projects.locations.products.patch";
  return query;
}

@end

@implementation GTLRVisionQuery_ProjectsLocationsProductsReferenceImagesCreate

@dynamic parent, referenceImageId;

+ (instancetype)queryWithObject:(GTLRVision_ReferenceImage *)object
                         parent:(NSString *)parent {
  if (object == nil) {
    GTLR_DEBUG_ASSERT(object != nil, @"Got a nil object");
    return nil;
  }
  NSArray *pathParams = @[ @"parent" ];
  NSString *pathURITemplate = @"v1/{+parent}/referenceImages";
  GTLRVisionQuery_ProjectsLocationsProductsReferenceImagesCreate *query =
    [[self alloc] initWithPathURITemplate:pathURITemplate
                               HTTPMethod:@"POST"
                       pathParameterNames:pathParams];
  query.bodyObject = object;
  query.parent = parent;
  query.expectedObjectClass = [GTLRVision_ReferenceImage class];
  query.loggingName = @"vision.projects.locations.products.referenceImages.create";
  return query;
}

@end

@implementation GTLRVisionQuery_ProjectsLocationsProductsReferenceImagesDelete

@dynamic name;

+ (instancetype)queryWithName:(NSString *)name {
  NSArray *pathParams = @[ @"name" ];
  NSString *pathURITemplate = @"v1/{+name}";
  GTLRVisionQuery_ProjectsLocationsProductsReferenceImagesDelete *query =
    [[self alloc] initWithPathURITemplate:pathURITemplate
                               HTTPMethod:@"DELETE"
                       pathParameterNames:pathParams];
  query.name = name;
  query.expectedObjectClass = [GTLRVision_Empty class];
  query.loggingName = @"vision.projects.locations.products.referenceImages.delete";
  return query;
}

@end

@implementation GTLRVisionQuery_ProjectsLocationsProductsReferenceImagesGet

@dynamic name;

+ (instancetype)queryWithName:(NSString *)name {
  NSArray *pathParams = @[ @"name" ];
  NSString *pathURITemplate = @"v1/{+name}";
  GTLRVisionQuery_ProjectsLocationsProductsReferenceImagesGet *query =
    [[self alloc] initWithPathURITemplate:pathURITemplate
                               HTTPMethod:nil
                       pathParameterNames:pathParams];
  query.name = name;
  query.expectedObjectClass = [GTLRVision_ReferenceImage class];
  query.loggingName = @"vision.projects.locations.products.referenceImages.get";
  return query;
}

@end

@implementation GTLRVisionQuery_ProjectsLocationsProductsReferenceImagesList

@dynamic pageSize, pageToken, parent;

+ (instancetype)queryWithParent:(NSString *)parent {
  NSArray *pathParams = @[ @"parent" ];
  NSString *pathURITemplate = @"v1/{+parent}/referenceImages";
  GTLRVisionQuery_ProjectsLocationsProductsReferenceImagesList *query =
    [[self alloc] initWithPathURITemplate:pathURITemplate
                               HTTPMethod:nil
                       pathParameterNames:pathParams];
  query.parent = parent;
  query.expectedObjectClass = [GTLRVision_ListReferenceImagesResponse class];
  query.loggingName = @"vision.projects.locations.products.referenceImages.list";
  return query;
}

@end
