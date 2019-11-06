import gql from "graphql-tag";

export default {
  DELETE_GOD: gql`
    mutation DeleteGod($id: ID) {
      deleteGod(id: $id) {
        id
      }
    }
  `,
  NEW_GOD: gql`
    mutation NewGod($name: String, $type: String, $description: String) {
      newGod(name: $name, type: $type, description: $description) {
        id
        name
        description
      }
    }
  `,
  UPDATE_GOD_NAME: gql`
    mutation UpdateGodName($id: ID, $name: String) {
      updateGod(id: $id, name: $name) {
        id
        name
      }
    }
  `,
  UPDATE_GOD_TYPE: gql`
    mutation UpdateGodType($id: ID, $type: String) {
      updateGod(id: $id, type: $type) {
        id
        type
      }
    }
  `,
  UPDATE_GOD_DESCRIPTION: gql`
    mutation UpdateGodDescription($id: ID, $description: String) {
      updateGod(id: $id, description: $description) {
        id
        description
      }
    }
  `,
	ADD_GOD_DOMAIN: gql`
		mutation AddGodDomain($godId: ID, $domain: String) {
			addGodDomain(godId: $godId, domain: $domain) {
				id
				domains
			}
		}
	`,
	DELETE_GOD_DOMAIN: gql`
		mutation DeleteGodDomain($godId: ID, $domain: String) {
			removeGodDomain(godId: $godId, domain: $domain) {
				id
				domains
			}
		}
	`,
	ADD_GOD_RELATIVE: gql`
		mutation AddGodRelative($godId: ID, $relativeId: ID, $relationship: String) {
			addGodRelative(godId: $godId, relativeId: $relativeId, relationship: $relationship) {
				id
				name
				parents {
					id
					name
				}
				children {
					id
					name
				}
				siblings {
					id
					name
				}
			}
		}
	`,
	NEW_EMBLEM: gql`
		mutation NewEmblem($name: String) {
			newEmblem(name: $name) {
				id
				name
			}
		}
	`,
	UPDATE_EMBLEM: gql`
		mutation UpdateEmblem($id: ID, $name: String) {
			updateEmblem(id: $id, name: $name) {
				id
				name
			}
		}
	`,
	NEW_ABODE: gql`
		mutation NewAbode($name: String, $coordinates: String) {
				newAbode(name: $name, coordinates: $coordinates) {
					id
					name
					coordinates
				}
		}
	`,
	UPDATE_ABODE: gql`
		mutation UpdateAbode($id: ID, $name: String, $coordinates: String) {
					updateAbode(id: $id, name: $name, coordinates: $coordinates) {
						id
						name
						coordinates
					}
		}
	`
};
