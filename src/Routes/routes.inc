(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
{---put your routes registration here---}
{ router.get('/', THomeControllerFactory.create()); }
{$INCLUDE Home/routes.inc}
{$INCLUDE Auth/routes.inc}
